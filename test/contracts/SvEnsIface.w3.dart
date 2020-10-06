// autogenerated - your edits will be overwritten!
import 'dart:io';
import 'dart:typed_data';
import 'package:dartz/dartz.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web3_contract_generator/helpers.dart';

final EthereumAddress _zeroAddr =
    EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));
EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;

class SvEnsIfaceContract {
  final ContractAbi $abi = ContractAbi.fromJson(
      File("SvEnsIface.abi").readAsStringSync(), "SvEnsIface");
  EthereumAddress $addr;
  DeployedContract $contract;
  Web3Client $client;
  SvEnsIfaceContract(String address, Web3Client this.$client) {
    $addr = EthereumAddress.fromHex(address);
    $contract = DeployedContract($abi, $addr);
  }

  Future<AddressType> resolver(FixedBytes node, {EthereumAddress from}) async {
    var _f = $contract.function("resolver");
    var params = _f.encodeCall(<dynamic>[node]);
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: params,
        atBlock: BlockNum.current());
    return result[0] as AddressType;
  }

  Future<AddressType> owner(FixedBytes node, {EthereumAddress from}) async {
    var _f = $contract.function("owner");
    var params = _f.encodeCall(<dynamic>[node]);
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: params,
        atBlock: BlockNum.current());
    return result[0] as AddressType;
  }

  Future<String> setSubnodeOwner(FixedBytes node, FixedBytes label,
      AddressType owner, Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("setSubnodeOwner");
    var params = _f.encodeCall(<dynamic>[node, label, owner]);
    var finalized = tx.finalize(
        data: params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> setTTL(FixedBytes node, UintType ttl, Wallet wallet,
      TransactionNotPayable tx) async {
    var _f = $contract.function("setTTL");
    var params = _f.encodeCall(<dynamic>[node, ttl]);
    var finalized = tx.finalize(
        data: params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<UintType> ttl(FixedBytes node, {EthereumAddress from}) async {
    var _f = $contract.function("ttl");
    var params = _f.encodeCall(<dynamic>[node]);
    var result = await $client.call(
        sender: _addrOrDefault(from),
        contract: $contract,
        function: _f,
        params: params,
        atBlock: BlockNum.current());
    return result[0] as UintType;
  }

  Future<String> setResolver(FixedBytes node, AddressType resolver,
      Wallet wallet, TransactionNotPayable tx) async {
    var _f = $contract.function("setResolver");
    var params = _f.encodeCall(<dynamic>[node, resolver]);
    var finalized = tx.finalize(
        data: params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }

  Future<String> setOwner(FixedBytes node, AddressType owner, Wallet wallet,
      TransactionNotPayable tx) async {
    var _f = $contract.function("setOwner");
    var params = _f.encodeCall(<dynamic>[node, owner]);
    var finalized = tx.finalize(
        data: params,
        from: await wallet.privateKey.extractAddress(),
        to: $contract.address);
    var txid = await $client.sendTransaction(wallet.privateKey, finalized,
        fetchChainIdFromNetworkId: true);
    return txid;
  }
}