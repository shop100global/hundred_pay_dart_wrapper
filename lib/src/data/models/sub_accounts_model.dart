import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class SubAccountsModel extends SubAccountsEntity {
  @override
  final BalanceModel? balance;
  @override
  final AccountModel? account;
  SubAccountsModel({
    this.balance,
    super.accountType,
    super.walletType,
    super.status,
    super.id,
    super.name,
    super.symbol,
    super.decimals,
    this.account,
    super.contractAddress,
    super.logo,
    super.userId,
    super.appId,
    super.network,
    super.ownerId,
    super.parentWallet,
    super.v,
  }) : super(balance: balance, account: account);

  SubAccountsModel copyWith({
    BalanceModel? balance,
    String? accountType,
    String? walletType,
    String? status,
    String? id,
    String? name,
    String? symbol,
    String? decimals,
    AccountModel? account,
    String? contractAddress,
    String? logo,
    String? userId,
    String? appId,
    String? network,
    String? ownerId,
    String? parentWallet,
    num? v,
  }) {
    return SubAccountsModel(
      balance: balance ?? this.balance,
      accountType: accountType ?? this.accountType,
      walletType: walletType ?? this.walletType,
      status: status ?? this.status,
      id: id ?? this.id,
      name: name ?? this.name,
      symbol: symbol ?? this.symbol,
      decimals: decimals ?? this.decimals,
      account: account ?? this.account,
      contractAddress: contractAddress ?? this.contractAddress,
      logo: logo ?? this.logo,
      userId: userId ?? this.userId,
      appId: appId ?? this.appId,
      network: network ?? this.network,
      ownerId: ownerId ?? this.ownerId,
      parentWallet: parentWallet ?? this.parentWallet,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (balance != null) {
      result.addAll({'balance': balance!.toMap()});
    }
    if (accountType != null) {
      result.addAll({'accountType': accountType});
    }
    if (walletType != null) {
      result.addAll({'walletType': walletType});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (symbol != null) {
      result.addAll({'symbol': symbol});
    }
    if (decimals != null) {
      result.addAll({'decimals': decimals});
    }
    if (account != null) {
      result.addAll({'account': account!.toMap()});
    }
    if (contractAddress != null) {
      result.addAll({'contractAddress': contractAddress});
    }
    if (logo != null) {
      result.addAll({'logo': logo});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (appId != null) {
      result.addAll({'appId': appId});
    }
    if (network != null) {
      result.addAll({'network': network});
    }
    if (ownerId != null) {
      result.addAll({'ownerId': ownerId});
    }
    if (parentWallet != null) {
      result.addAll({'parentWallet': parentWallet});
    }
    if (v != null) {
      result.addAll({'v': v});
    }

    return result;
  }

  factory SubAccountsModel.fromMap(Map<String, dynamic> map) {
    return SubAccountsModel(
      balance:
          map['balance'] != null ? BalanceModel.fromMap(map['balance']) : null,
      accountType: map['accountType'],
      walletType: map['walletType'],
      status: map['status'],
      id: map['_id'],
      name: map['name'],
      symbol: map['symbol'],
      decimals: map['decimals'],
      account:
          map['account'] != null ? AccountModel.fromMap(map['account']) : null,
      contractAddress: map['contractAddress'],
      logo: map['logo'],
      userId: map['userId'],
      appId: map['appId'],
      network: map['network'],
      ownerId: map['ownerId'],
      parentWallet: map['parentWallet'],
      v: map['__v'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SubAccountsModel.fromJson(String source) =>
      SubAccountsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SubAccountsModel(balance: $balance, accountType: $accountType, walletType: $walletType, status: $status, id: $id, name: $name, symbol: $symbol, decimals: $decimals, account: $account, contractAddress: $contractAddress, logo: $logo, userId: $userId, appId: $appId, network: $network, ownerId: $ownerId, parentWallet: $parentWallet, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SubAccountsModel &&
        other.balance == balance &&
        other.accountType == accountType &&
        other.walletType == walletType &&
        other.status == status &&
        other.id == id &&
        other.name == name &&
        other.symbol == symbol &&
        other.decimals == decimals &&
        other.account == account &&
        other.contractAddress == contractAddress &&
        other.logo == logo &&
        other.userId == userId &&
        other.appId == appId &&
        other.network == network &&
        other.ownerId == ownerId &&
        other.parentWallet == parentWallet &&
        other.v == v;
  }

  @override
  int get hashCode {
    return balance.hashCode ^
        accountType.hashCode ^
        walletType.hashCode ^
        status.hashCode ^
        id.hashCode ^
        name.hashCode ^
        symbol.hashCode ^
        decimals.hashCode ^
        account.hashCode ^
        contractAddress.hashCode ^
        logo.hashCode ^
        userId.hashCode ^
        appId.hashCode ^
        network.hashCode ^
        ownerId.hashCode ^
        parentWallet.hashCode ^
        v.hashCode;
  }
}
