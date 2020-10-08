import 'dart:async';

import 'package:build/build.dart';
import 'package:dart_style/dart_style.dart';
import 'package:dartz/dartz.dart';
import 'package:logging/logging.dart';
import 'package:web3_contract_generator/helpers.dart';
import 'package:web3dart/contracts.dart';

final Logger _log = Logger('web3_contract_generator');

// class Web3ContractGenerator extends Library {
//   @override
//   FutureOr<String> generate(LibraryReader lib, BuildStep step) {}
// }

/// The builder class which does the code generation.
class Web3ContractGenerator extends Builder {
  bool nonNullableEnabled;

  Web3ContractGenerator({this.nonNullableEnabled = false});

  @override
  final buildExtensions = {
    '.abi': ['.w3.dart'],
    '.abi.json': ['.w3.dart'],
  };

  @override
  Future<void> build(BuildStep buildStep) async {
    //Logger.level = Level.info;
    Logger.root.level = Level.INFO;
    final fileNameWithExt = buildStep.inputId.pathSegments.last;
    _log.fine(
        'Web3ContractGenerator (${fileNameWithExt}): Reading file as JSON.');
    var abiString = await buildStep.readAsString(buildStep.inputId);
    _log.fine(
        'Web3ContractGenerator (${fileNameWithExt}): ABI of length ${abiString.length}');

    var output = genWholeW3ContractFile(abiString, fileNameWithExt);
    var outputAsset = buildStep.inputId.changeExtension('.w3.dart');
    print('outputing: ${outputAsset.pathSegments.last}');
    await buildStep.writeAsString(outputAsset, output);
  }
}

/// Generate the whole output file as a string.
String genWholeW3ContractFile(
  String abiString,
  String fileNameWithExt, {
  bool nonNullableEnabled = false,
}) {
  final fileNameNoExt = fileNameWithExt.split('.')[0];
  var abi = ContractAbi.fromJson(abiString, fileNameNoExt);

  var late_keyword_padded = nonNullableEnabled ? 'late ' : ' ';
  var contractClassName = '${abi.name}Contract';
  var abiConstName = '${abi.name.toUpperCase()}_ABI';

  var outputFileContents = <String>[
    '// autogenerated - your edits will be overwritten!',
    "import 'dart:io';",
    "import 'dart:typed_data';",
    "import 'package:dartz/dartz.dart';",
    "import 'package:web3dart/web3dart.dart';",
    "import 'package:web3_contract/web3_contract.dart';",
    '',
    'const ${abiConstName} = \'\'\'${abiString.trim()}\'\'\';',
    ''
        'final EthereumAddress _zeroAddr = EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));',
    'EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;',
    '',
    'class ${contractClassName} {',
    '  DeployedContract \$contract;',
    '  EthereumAddress get \$addr => \$contract.addr;',
    '  ContractAbi get \$abi = \$contract.abi;', // ;',
    '  Web3Client \$client;',
    '  ${contractClassName}(String address, this.\$client) : \$contract = DeployedContract(ContractAbi.fromJson(${abiConstName}, \'$fileNameNoExt\'), EthereumAddress.fromHex(address)) {',
    '  }',
    '',
    //'Future<T> txFactory<T>() async {}',
    '',
    abiToMethods(abi, nullable: nonNullableEnabled),
    '}',
  ].join('\n');

  return DartFormatter(pageWidth: 80, lineEnding: '\n')
      .format(outputFileContents);
}

String abiToMethods(ContractAbi abi, {bool nullable = true}) {
  return abi.functions
      .map((f) => abiFuncToMethod(f, nullable: nullable))
      .join('\n\n');
}

/// convert a `ContractFragment` to a source code fragment of a dart proxy implementation.
String abiFuncToMethod(ContractFunction func, {bool nullable = false}) {
  var paramWithNames =
      zip<FunctionParameter, int>(func.parameters, CountForever())
          .map((t) => paramAddParamName(t.value1, t.value2))
          .toList();
  var paramTypesAndNames = paramWithNames.map((pn) =>
      '${web3TypesToDart(pn.value1.type.runtimeType.toString())} ${pn.value2}');
  var paramNames = paramWithNames.map((pn) => pn.value2);
  return [
    [
      wrap<Future>(
          func.isConstant ? abiOutputToReturnType(func.outputs) : 'String',
          nullable: nullable),
      ' ',
      func.name.isNotEmpty
          ? func.name
          : func.isConstructor
              ? '\$constructor'
              : '\$fallback',
      '(',
      [
        ...(paramTypesAndNames),
        ...(func.isConstant
            ? <String>['{EthereumAddress${nullable ? "?" : ""} from}']
            : [
                'Wallet wallet',
                (func.isPayable
                    ? 'TransactionPayable tx'
                    : 'TransactionNotPayable tx')
              ]),
      ].join(', '),
      ') async {',
    ].join(''),
    [
      'var _f = ',
      func.name.isNotEmpty
          ? '\$contract.function(\'${func.name}\')'
          : '\$abi.functions.where((f) => f.name == \'${func.name}\' && f.${func.isConstructor ? "isConstructor" : "isDefault"}).first',
      ';'
    ].join(''),
    ...(func.isConstant
        ? <String>[
            [
              'var _params = <dynamic>[',
              paramNames.join(', '),
              '];',
            ].join(''),
            'var result = await \$client.call(sender: _addrOrDefault(from), contract: \$contract, function: _f, params: _params, atBlock: BlockNum.current());',
            (func.outputs.length > 1)
                ? 'return Tuple${func.outputs.length}(' +
                    [
                      for (var r in zip(
                          Iterable<int>.generate(func.outputs.length),
                          func.outputs))
                        'result[${r.value1}] as ${web3TypesToDart(r.value2.type.runtimeType.toString())}'
                    ].join(', ') +
                    ');'
                : 'return' +
                    (func.outputs.length == 1
                        ? ' result[0] as ${web3TypesToDart(func.outputs.first.type.runtimeType.toString())}'
                        : '') +
                    ';',
          ]
        : [
            [
              'var _params = _f.encodeCall(<dynamic>[',
              paramNames.join(', '),
              ']);',
            ].join(''),
            'var finalized = tx.finalize(data: _params, from: await wallet.privateKey.extractAddress(), to: \$contract.address);',
            'var txid = await \$client.sendTransaction(wallet.privateKey, finalized, fetchChainIdFromNetworkId: true);',
            // 'var txr = waitFor(() => \$client.getTransactionReceipt(txid));',
            'return txid;'
          ]),
    '}',
  ].join('\n');
}

/// Wrap the dart source code fragment of a type in `Future`. i.e. `Future<${type}>`.
String wrap<T>(String returnType, {bool nullable = false}) =>
    '${T.toString().split("<")[0]}<${returnType}${nullable && returnType != "void" ? "?" : ""}>';

/// Convert `List<FunctionParameter>` to a dart source code fragment of the equivalent web3dart return type (using TupleX where necessary).
String abiOutputToReturnType(List<FunctionParameter> outputs) {
  if (outputs.isEmpty) return 'void';
  if (outputs.length == 1) {
    return web3TypesToDart(outputs.first.type.runtimeType.toString());
  } else if (outputs.length > 20) {
    throw Exception(
        "abiOutputToReturnType can't handle more than 20 return types.");
  }
  return [
    'Tuple${outputs.length}<',
    outputs
        .map((o) => web3TypesToDart(o.type.runtimeType.toString()))
        .join(', '),
    '>',
  ].join('');
}

String web3TypesToDart(String web3Ty) {
  return _web3TypesLookup.containsKey(web3Ty)
      ? _web3TypesLookup[web3Ty]
      : web3Ty;
}

const _web3TypesLookup = <String, String>{
  'AddressType': 'EthereumAddress',
  'String': 'String',
  'FixedBytes': 'Uint8List',
  'DynamicBytes': 'Uint8List',
  'UintType': 'BigInt',
  'IntType': 'BigInt',
  'FixedLengthArray': 'List',
  'DynamicLengthArray': 'List',
  'BoolType': 'bool',
};

/// Convert a `FunctionParameter` to a source code fragment of the equivalent web3dart type.
Tuple2<FunctionParameter, String> paramAddParamName(
    FunctionParameter param, int nth_param) {
  return Tuple2(param, param.name.isEmpty ? 'param_${nth_param}' : param.name);
}

/// The generator the builder actually uses.
Builder web3ContractGen(BuilderOptions opts) => Web3ContractGenerator();
