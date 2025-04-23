import 'package:hundred_pay_hq_wrapper/src/src.dart';

class SubAccountsEntity {
  final BalanceEntity? balance;
  final String? accountType;
  final String? walletType;
  final String? status;
  final String? id;
  final String? name;
  final String? symbol;
  final String? decimals;
  final AccountEntity? account;
  final String? contractAddress;
  final String? logo;
  final String? userId;
  final String? appId;
  final String? network;
  final String? ownerId;
  final String? parentWallet;
  final num? v;

  SubAccountsEntity({
    this.balance,
    this.accountType,
    this.walletType,
    this.status,
    this.id,
    this.name,
    this.symbol,
    this.decimals,
    this.account,
    this.contractAddress,
    this.logo,
    this.userId,
    this.appId,
    this.network,
    this.ownerId,
    this.parentWallet,
    this.v,
  });
}
