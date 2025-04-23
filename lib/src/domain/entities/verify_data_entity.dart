import 'package:hundred_pay_hq_wrapper/src/src.dart';

class VerifyDataEntity {
  final num? retries;
  final bool? acknowledged;
  final bool? dispatched;
  final String? type;
  final String? id;
  final String? chargeId;
  final String? reference;
  final DataEntity? data;
  final String? cryptoChargeId;
  final DateTime? createdAt;
  final num? v;

  VerifyDataEntity({
    this.retries,
    this.acknowledged,
    this.dispatched,
    this.type,
    this.id,
    this.chargeId,
    this.reference,
    this.data,
    this.cryptoChargeId,
    this.createdAt,
    this.v,
  });
}
