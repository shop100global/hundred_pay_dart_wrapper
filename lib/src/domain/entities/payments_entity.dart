import 'package:hundred_pay_hq_wrapper/src/src.dart';

class PaymentsEntity {
  final String? from;
  final String? to;
  final String? network;
  final String? transaction_id;
  final String? status;
  final DateTime? timestamp;
  final ValueEntity? value;
  final BlockEntity? block;

  PaymentsEntity({
    this.from,
    this.to,
    this.network,
    this.transaction_id,
    this.status,
    this.timestamp,
    this.value,
    this.block,
  });
}
