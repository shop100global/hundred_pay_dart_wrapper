import 'package:hundred_pay_hq_wrapper/src/src.dart';

class ChargeEntity {
  final CustomerEntity? customer;
  final BillingEntity? billing;
  final StatusEntity? status;
  final String? ref_id;
  final List<PaymentsEntity>? payments;
  final String? charge_source;
  final DateTime? createdAt;
  final String? id;
  final Map<String, dynamic>? metadata;
  final String? call_back_url;
  final String? app_id;
  final String? userId;
  final String? chargeId;
  final num? v;

  ChargeEntity({
    this.customer,
    this.billing,
    this.status,
    this.ref_id,
    this.payments,
    this.charge_source,
    this.createdAt,
    this.id,
    this.metadata,
    this.call_back_url,
    this.app_id,
    this.userId,
    this.chargeId,
    this.v,
  });
}
