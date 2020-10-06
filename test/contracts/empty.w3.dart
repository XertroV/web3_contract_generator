  // autogenerated - your edits will be overwritten!
  import 'dart:io';
  import 'dart:typed_data';
  import 'package:dartz/dartz.dart';
  import 'package:web3dart/web3dart.dart';
  import 'package:web3_contract_generator/helpers.dart';

  final EthereumAddress _zeroAddr =
      EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));
  EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;

  class emptyContract {
    final ContractAbi $abi = ContractAbi.fromJson(
        File("empty.abi").readAsStringSync(), "empty");
    EthereumAddress $addr;
    DeployedContract $contract;
    Web3Client $client;
    emptyContract(String address, Web3Client this.$client) {
      $addr = EthereumAddress.fromHex(address);
      $contract = DeployedContract($abi, $addr);
    }
  }
