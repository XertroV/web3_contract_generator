  // autogenerated - your edits will be overwritten!
  import 'dart:io';
  import 'dart:typed_data';
  import 'package:dartz/dartz.dart';
  import 'package:web3dart/web3dart.dart';
  import 'package:web3_contract_generator/helpers.dart';

  final EthereumAddress _zeroAddr =
      EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));
  EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;

  class SVPaymentsContract {
    final ContractAbi $abi = ContractAbi.fromJson(
        File("SVPayments.abi").readAsStringSync(), "SVPayments");
    EthereumAddress $addr;
    DeployedContract $contract;
    Web3Client $client;
    SVPaymentsContract(String address, Web3Client this.$client) {
      $addr = EthereumAddress.fromHex(address);
      $contract = DeployedContract($abi, $addr);
    }

    Future<String> payForDemocracy(
        FixedBytes democHash, Wallet wallet, TransactionPayable tx) async {
      var _f = $contract.function("payForDemocracy");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> giveTimeToDemoc(
        FixedBytes democHash,
        UintType additionalSeconds,
        FixedBytes ref,
        Wallet wallet,
        TransactionNotPayable tx) async {
      var _f = $contract.function("giveTimeToDemoc");
      var params = _f.encodeCall(<dynamic>[democHash, additionalSeconds, ref]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> setBasicCentsPricePer30Days(
        UintType amount, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setBasicCentsPricePer30Days");
      var params = _f.encodeCall(<dynamic>[amount]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> getVersion({EthereumAddress from}) async {
      var _f = $contract.function("getVersion");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> doLockdown(Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("doLockdown");
      var params = _f.encodeCall(<dynamic>[]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<BoolType> getDenyPremium(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDenyPremium");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<String> setOwner(
        AddressType newOwner, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setOwner");
      var params = _f.encodeCall(<dynamic>[newOwner]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> emergencySetOwner(
        AddressType newOwner, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("emergencySetOwner");
      var params = _f.encodeCall(<dynamic>[newOwner]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<AddressType> minorEditsAddr({EthereumAddress from}) async {
      var _f = $contract.function("minorEditsAddr");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as AddressType;
    }

    Future<String> reclaimToken(
        AddressType token, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("reclaimToken");
      var params = _f.encodeCall(<dynamic>[token]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> centsToWei(UintType c, {EthereumAddress from}) async {
      var _f = $contract.function("centsToWei");
      var params = _f.encodeCall(<dynamic>[c]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<BoolType> hasPermissions(AddressType a,
        {EthereumAddress from}) async {
      var _f = $contract.function("hasPermissions");
      var params = _f.encodeCall(<dynamic>[a]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<AddressType> getAdminLog(UintType n, {EthereumAddress from}) async {
      var _f = $contract.function("getAdminLog");
      var params = _f.encodeCall(<dynamic>[n]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as AddressType;
    }

    Future<BoolType> isAdmin(AddressType a, {EthereumAddress from}) async {
      var _f = $contract.function("isAdmin");
      var params = _f.encodeCall(<dynamic>[a]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<String> setDenyPremium(
        FixedBytes democHash,
        BoolType isPremiumDenied,
        Wallet wallet,
        TransactionNotPayable tx) async {
      var _f = $contract.function("setDenyPremium");
      var params = _f.encodeCall(<dynamic>[democHash, isPremiumDenied]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<BoolType> accountInGoodStanding(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("accountInGoodStanding");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<String> setMinorEditsAddr(
        AddressType a, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setMinorEditsAddr");
      var params = _f.encodeCall(<dynamic>[a]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> currAdminEpoch({EthereumAddress from}) async {
      var _f = $contract.function("currAdminEpoch");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> downgradeToBasic(
        FixedBytes democHash, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("downgradeToBasic");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> getAdminLogN({EthereumAddress from}) async {
      var _f = $contract.function("getAdminLogN");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> incAdminEpoch(
        Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("incAdminEpoch");
      var params = _f.encodeCall(<dynamic>[]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> setAdmin(AddressType a, BoolType _givePerms, Wallet wallet,
        TransactionNotPayable tx) async {
      var _f = $contract.function("setAdmin");
      var params = _f.encodeCall(<dynamic>[a, _givePerms]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> payoutAll(Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("payoutAll");
      var params = _f.encodeCall(<dynamic>[]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> upgradeMe(
        AddressType newSC, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("upgradeMe");
      var params = _f.encodeCall(<dynamic>[newSC]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> getBasicBallotsPer30Days({EthereumAddress from}) async {
      var _f = $contract.function("getBasicBallotsPer30Days");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<BoolType> adminsDisabledForever({EthereumAddress from}) async {
      var _f = $contract.function("adminsDisabledForever");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<UintType> getMinWeiForDInit({EthereumAddress from}) async {
      var _f = $contract.function("getMinWeiForDInit");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> setPermissions(AddressType e, BoolType _editPerms,
        Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setPermissions");
      var params = _f.encodeCall(<dynamic>[e, _editPerms]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> setPayTo(
        AddressType newPayTo, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setPayTo");
      var params = _f.encodeCall(<dynamic>[newPayTo]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<BoolType> getFreeExtension(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getFreeExtension");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<UintType> getPaymentLogN({EthereumAddress from}) async {
      var _f = $contract.function("getPaymentLogN");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<UintType> weiToCents(UintType w, {EthereumAddress from}) async {
      var _f = $contract.function("weiToCents");
      var params = _f.encodeCall(<dynamic>[w]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<AddressType> emergencyAdmin({EthereumAddress from}) async {
      var _f = $contract.function("emergencyAdmin");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as AddressType;
    }

    Future<BoolType> getPremiumStatus(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getPremiumStatus");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<UintType> getPremiumMultiplier({EthereumAddress from}) async {
      var _f = $contract.function("getPremiumMultiplier");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<BoolType> adminLockdown({EthereumAddress from}) async {
      var _f = $contract.function("adminLockdown");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<UintType> getWeiPerCent({EthereumAddress from}) async {
      var _f = $contract.function("getWeiPerCent");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> upgradeMeAdmin(
        AddressType newAdmin, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("upgradeMeAdmin");
      var params = _f.encodeCall(<dynamic>[newAdmin]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<AddressType> owner({EthereumAddress from}) async {
      var _f = $contract.function("owner");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as AddressType;
    }

    Future<String> setBasicBallotsPer30Days(
        UintType amount, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setBasicBallotsPer30Days");
      var params = _f.encodeCall(<dynamic>[amount]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> getBasicExtraBallotFeeWei({EthereumAddress from}) async {
      var _f = $contract.function("getBasicExtraBallotFeeWei");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> upgradePermissionedSC(AddressType oldSC, AddressType newSC,
        Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("upgradePermissionedSC");
      var params = _f.encodeCall(<dynamic>[oldSC, newSC]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> setFreeExtension(FixedBytes democHash, BoolType hasFreeExt,
        Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setFreeExtension");
      var params = _f.encodeCall(<dynamic>[democHash, hasFreeExt]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> upgradeToPremium(
        FixedBytes democHash, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("upgradeToPremium");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> setWeiPerCent(
        UintType wpc, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setWeiPerCent");
      var params = _f.encodeCall(<dynamic>[wpc]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<Tuple4<BoolType, UintType, UintType, BoolType>> getAccount(
        FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getAccount");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return Tuple4(result[0] as BoolType, result[1] as UintType,
          result[2] as UintType, result[3] as BoolType);
    }

    Future<UintType> getUsdEthExchangeRate({EthereumAddress from}) async {
      var _f = $contract.function("getUsdEthExchangeRate");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> setPremiumMultiplier(
        UintType m, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setPremiumMultiplier");
      var params = _f.encodeCall(<dynamic>[m]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> getBasicCentsPricePer30Days({EthereumAddress from}) async {
      var _f = $contract.function("getBasicCentsPricePer30Days");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<UintType> getPremiumCentsPricePer30Days(
        {EthereumAddress from}) async {
      var _f = $contract.function("getPremiumCentsPricePer30Days");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<UintType> getSecondsRemaining(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getSecondsRemaining");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<AddressType> getPayTo({EthereumAddress from}) async {
      var _f = $contract.function("getPayTo");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as AddressType;
    }

    Future<String> setMinWeiForDInit(
        UintType amount, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setMinWeiForDInit");
      var params = _f.encodeCall(<dynamic>[amount]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> weiBuysHowManySeconds(UintType amount,
        {EthereumAddress from}) async {
      var _f = $contract.function("weiBuysHowManySeconds");
      var params = _f.encodeCall(<dynamic>[amount]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<Tuple4<BoolType, FixedBytes, UintType, UintType>> getPaymentLog(
        UintType n,
        {EthereumAddress from}) async {
      var _f = $contract.function("getPaymentLog");
      var params = _f.encodeCall(<dynamic>[n]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return Tuple4(result[0] as BoolType, result[1] as FixedBytes,
          result[2] as UintType, result[3] as UintType);
    }

    Future<String> doFreeExtension(
        FixedBytes democHash, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("doFreeExtension");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> $constructor(AddressType _emergencyAdmin, Wallet wallet,
        TransactionNotPayable tx) async {
      var _f =
          $abi.functions.where((f) => f.name == "" && f.isConstructor).first;
      var params = _f.encodeCall(<dynamic>[_emergencyAdmin]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> $fallback(Wallet wallet, TransactionPayable tx) async {
      var _f = $abi.functions.where((f) => f.name == "" && f.isDefault).first;
      var params = _f.encodeCall(<dynamic>[]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }
  }
