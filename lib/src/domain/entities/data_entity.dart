import 'package:hundred_pay_hq_wrapper/src/src.dart';

class DataEntity {
  final String? from;
  final String? to;
  final String? network;
  final String? transaction_id;
  final String? status;
  final DateTime? timestamp;
  final ValueEntity? value;
  final BlockEntity? block;
  final ChargeEntity? charge;
  final String? appId;

  DataEntity({
    this.from,
    this.to,
    this.network,
    this.transaction_id,
    this.status,
    this.timestamp,
    this.value,
    this.block,
    this.charge,
    this.appId,
  });
}
