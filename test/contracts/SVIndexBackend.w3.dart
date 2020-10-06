  // autogenerated - your edits will be overwritten!
  import 'dart:io';
  import 'dart:typed_data';
  import 'package:dartz/dartz.dart';
  import 'package:web3dart/web3dart.dart';
  import 'package:web3_contract_generator/helpers.dart';

  final EthereumAddress _zeroAddr =
      EthereumAddress(Uint8List(20)..fillRange(0, 20, 0));
  EthereumAddress _addrOrDefault(EthereumAddress addr) => addr ?? _zeroAddr;

  class SVIndexBackendContract {
    final ContractAbi $abi = ContractAbi.fromJson(
        File("SVIndexBackend.abi").readAsStringSync(), "SVIndexBackend");
    EthereumAddress $addr;
    DeployedContract $contract;
    Web3Client $client;
    SVIndexBackendContract(String address, Web3Client this.$client) {
      $addr = EthereumAddress.fromHex(address);
      $contract = DeployedContract($abi, $addr);
    }

    Future<UintType> getDCategoriesN(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDCategoriesN");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> dDeprecateCategory(FixedBytes democHash, UintType catId,
        Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("dDeprecateCategory");
      var params = _f.encodeCall(<dynamic>[democHash, catId]);
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

    Future<String> dAdd(
        FixedBytes democHash,
        AddressType erc20,
        BoolType disableErc20OwnerClaim,
        Wallet wallet,
        TransactionNotPayable tx) async {
      var _f = $contract.function("dAdd");
      var params =
          _f.encodeCall(<dynamic>[democHash, erc20, disableErc20OwnerClaim]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
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

    Future<FixedBytes> getGDemoc(UintType id, {EthereumAddress from}) async {
      var _f = $contract.function("getGDemoc");
      var params = _f.encodeCall(<dynamic>[id]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as FixedBytes;
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

    Future<String> dSetCommunityBallotsEnabled(FixedBytes democHash,
        BoolType enabled, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("dSetCommunityBallotsEnabled");
      var params = _f.encodeCall(<dynamic>[democHash, enabled]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<Tuple4<BoolType, FixedBytes, BoolType, UintType>> getDCategory(
        FixedBytes democHash, UintType catId,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDCategory");
      var params = _f.encodeCall(<dynamic>[democHash, catId]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return Tuple4(result[0] as BoolType, result[1] as FixedBytes,
          result[2] as BoolType, result[3] as UintType);
    }

    Future<String> dAddCategory(
        FixedBytes democHash,
        FixedBytes name,
        BoolType hasParent,
        UintType parent,
        Wallet wallet,
        TransactionNotPayable tx) async {
      var _f = $contract.function("dAddCategory");
      var params = _f.encodeCall(<dynamic>[democHash, name, hasParent, parent]);
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

    Future<String> setDNoEditors(
        FixedBytes democHash, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setDNoEditors");
      var params = _f.encodeCall(<dynamic>[democHash]);
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

    Future<AddressType> getDErc20(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDErc20");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as AddressType;
    }

    Future<FixedBytes> getDHash(FixedBytes prefix,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDHash");
      var params = _f.encodeCall(<dynamic>[prefix]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as FixedBytes;
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

    Future<UintType> getDCountedBasicBallotID(FixedBytes democHash, UintType n,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDCountedBasicBallotID");
      var params = _f.encodeCall(<dynamic>[democHash, n]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<BoolType> getDCommBallotsEnabled(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDCommBallotsEnabled");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<AddressType> getDOwner(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDOwner");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as AddressType;
    }

    Future<DynamicBytes> getDEditorArbitraryData(
        FixedBytes democHash, DynamicBytes key,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDEditorArbitraryData");
      var params = _f.encodeCall(<dynamic>[democHash, key]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as DynamicBytes;
    }

    Future<String> dDisableErc20OwnerClaim(
        FixedBytes democHash, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("dDisableErc20OwnerClaim");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
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

    Future<BoolType> getDErc20OwnerClaimEnabled(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDErc20OwnerClaimEnabled");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<UintType> getDBallotsN(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDBallotsN");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
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

    Future<String> dSetArbitraryData(FixedBytes democHash, DynamicBytes key,
        DynamicBytes value, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("dSetArbitraryData");
      var params = _f.encodeCall(<dynamic>[democHash, key, value]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> dAddBallot(
        FixedBytes democHash,
        UintType ballotId,
        UintType packed,
        BoolType countTowardsLimit,
        Wallet wallet,
        TransactionNotPayable tx) async {
      var _f = $contract.function("dAddBallot");
      var params = _f.encodeCall(
          <dynamic>[democHash, ballotId, packed, countTowardsLimit]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> dSetEditorArbitraryData(
        FixedBytes democHash,
        DynamicBytes key,
        DynamicBytes value,
        Wallet wallet,
        TransactionNotPayable tx) async {
      var _f = $contract.function("dSetEditorArbitraryData");
      var params = _f.encodeCall(<dynamic>[democHash, key, value]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
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

    Future<UintType> getGDemocsN({EthereumAddress from}) async {
      var _f = $contract.function("getGDemocsN");
      var params = _f.encodeCall(<dynamic>[]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<DynamicLengthArray<dynamic>> getGErc20ToDemocs(AddressType erc20,
        {EthereumAddress from}) async {
      var _f = $contract.function("getGErc20ToDemocs");
      var params = _f.encodeCall(<dynamic>[erc20]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as DynamicLengthArray<dynamic>;
    }

    Future<String> dInit(
        AddressType defaultErc20,
        AddressType initOwner,
        BoolType disableErc20OwnerClaim,
        Wallet wallet,
        TransactionNotPayable tx) async {
      var _f = $contract.function("dInit");
      var params = _f.encodeCall(
          <dynamic>[defaultErc20, initOwner, disableErc20OwnerClaim]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<Tuple3<AddressType, AddressType, UintType>> getDInfo(
        FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDInfo");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return Tuple3(result[0] as AddressType, result[1] as AddressType,
          result[2] as UintType);
    }

    Future<String> setDOwner(FixedBytes democHash, AddressType newOwner,
        Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setDOwner");
      var params = _f.encodeCall(<dynamic>[democHash, newOwner]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> emergencySetDOwner(FixedBytes democHash,
        AddressType newOwner, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("emergencySetDOwner");
      var params = _f.encodeCall(<dynamic>[democHash, newOwner]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> getDBallotID(FixedBytes democHash, UintType n,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDBallotID");
      var params = _f.encodeCall(<dynamic>[democHash, n]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<BoolType> isDEditor(FixedBytes democHash, AddressType editor,
        {EthereumAddress from}) async {
      var _f = $contract.function("isDEditor");
      var params = _f.encodeCall(<dynamic>[democHash, editor]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as BoolType;
    }

    Future<String> setDErc20(FixedBytes democHash, AddressType newErc20,
        Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setDErc20");
      var params = _f.encodeCall(<dynamic>[democHash, newErc20]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<UintType> getDCountedBasicBallotsN(FixedBytes democHash,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDCountedBasicBallotsN");
      var params = _f.encodeCall(<dynamic>[democHash]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as UintType;
    }

    Future<String> setDEditor(FixedBytes democHash, AddressType editor,
        BoolType canEdit, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setDEditor");
      var params = _f.encodeCall(<dynamic>[democHash, editor, canEdit]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<DynamicBytes> getDArbitraryData(
        FixedBytes democHash, DynamicBytes key,
        {EthereumAddress from}) async {
      var _f = $contract.function("getDArbitraryData");
      var params = _f.encodeCall(<dynamic>[democHash, key]);
      var result = await $client.call(
          sender: _addrOrDefault(from),
          contract: $contract,
          function: _f,
          params: params,
          atBlock: BlockNum.current());
      return result[0] as DynamicBytes;
    }

    Future<String> setDOwnerFromClaim(FixedBytes democHash,
        AddressType newOwner, Wallet wallet, TransactionNotPayable tx) async {
      var _f = $contract.function("setDOwnerFromClaim");
      var params = _f.encodeCall(<dynamic>[democHash, newOwner]);
      var finalized = tx.finalize(
          data: params,
          from: await wallet.privateKey.extractAddress(),
          to: $contract.address);
      var txid = await $client.sendTransaction(wallet.privateKey, finalized,
          fetchChainIdFromNetworkId: true);
      return txid;
    }

    Future<String> $constructor(Wallet wallet, TransactionNotPayable tx) async {
      var _f =
          $abi.functions.where((f) => f.name == "" && f.isConstructor).first;
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
