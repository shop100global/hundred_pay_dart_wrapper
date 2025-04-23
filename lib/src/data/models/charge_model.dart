import 'dart:convert';
import 'package:hundred_pay_hq_wrapper/src/src.dart';
import 'package:collection/collection.dart';

final listEquals = const ListEquality().equals;
final mapEquals = const MapEquality().equals;

class ChargeModel extends ChargeEntity {
  @override
  final CustomerModel? customer;
  @override
  final BillingModel? billing;
  @override
  final StatusModel? status;
  @override
  final List<PaymentsModel>? payments;

  ChargeModel({
    this.customer,
    this.billing,
    this.status,
    super.ref_id,
    this.payments,
    super.charge_source,
    super.createdAt,
    super.id,
    super.metadata,
    super.call_back_url,
    super.app_id,
    super.userId,
    super.chargeId,
    super.v,
  }) : super(
         customer: customer,
         billing: billing,
         status: status,
         payments: payments,
       );

  ChargeModel copyWith({
    CustomerModel? customer,
    BillingModel? billing,
    StatusModel? status,
    String? ref_id,
    List<PaymentsModel>? payments,
    String? charge_source,
    DateTime? createdAt,
    String? id,
    Map<String, dynamic>? metadata,
    String? call_back_url,
    String? app_id,
    String? userId,
    String? chargeId,
    num? v,
  }) {
    return ChargeModel(
      customer: customer ?? this.customer,
      billing: billing ?? this.billing,
      status: status ?? this.status,
      ref_id: ref_id ?? this.ref_id,
      payments: payments ?? this.payments,
      charge_source: charge_source ?? this.charge_source,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      metadata: metadata ?? this.metadata,
      call_back_url: call_back_url ?? this.call_back_url,
      app_id: app_id ?? this.app_id,
      userId: userId ?? this.userId,
      chargeId: chargeId ?? this.chargeId,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (customer != null) {
      result.addAll({'customer': customer!.toMap()});
    }
    if (billing != null) {
      result.addAll({'billing': billing!.toMap()});
    }
    if (status != null) {
      result.addAll({'status': status!.toMap()});
    }
    if (ref_id != null) {
      result.addAll({'ref_id': ref_id});
    }
    if (payments != null) {
      result.addAll({'payments': payments!.map((x) => x.toMap()).toList()});
    }
    if (charge_source != null) {
      result.addAll({'charge_source': charge_source});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (metadata != null) {
      result.addAll({'metadata': metadata});
    }
    if (call_back_url != null) {
      result.addAll({'call_back_url': call_back_url});
    }
    if (app_id != null) {
      result.addAll({'app_id': app_id});
    }
    if (userId != null) {
      result.addAll({'userId': userId});
    }
    if (chargeId != null) {
      result.addAll({'chargeId': chargeId});
    }
    if (v != null) {
      result.addAll({'v': v});
    }

    return result;
  }

  factory ChargeModel.fromMap(Map<String, dynamic> map) {
    return ChargeModel(
      customer:
          map['customer'] != null
              ? CustomerModel.fromMap(map['customer'])
              : null,
      billing:
          map['billing'] != null ? BillingModel.fromMap(map['billing']) : null,
      status: map['status'] != null ? StatusModel.fromMap(map['status']) : null,
      ref_id: map['ref_id'],
      payments:
          map['payments'] != null
              ? List<PaymentsModel>.from(
                map['payments']?.map((x) => PaymentsModel.fromMap(x)),
              )
              : null,
      charge_source: map['charge_source'],
      createdAt:
          map['createdAt'] != null ? DateTime.tryParse(map['createdAt']) : null,
      id: map['_id'],
      metadata: Map<String, dynamic>.from(map['metadata']),
      call_back_url: map['call_back_url'],
      app_id: map['app_id'],
      userId: map['userId'],
      chargeId: map['chargeId'],
      v: map['__v'],
    );
  }

  String toJson() => json.encode(toMap());

  factory ChargeModel.fromJson(String source) =>
      ChargeModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ChargeModel(customer: $customer, billing: $billing, status: $status, ref_id: $ref_id, payments: $payments, charge_source: $charge_source, createdAt: $createdAt, id: $id, metadata: $metadata, call_back_url: $call_back_url, app_id: $app_id, userId: $userId, chargeId: $chargeId, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ChargeModel &&
        other.customer == customer &&
        other.billing == billing &&
        other.status == status &&
        other.ref_id == ref_id &&
        listEquals(other.payments, payments) &&
        other.charge_source == charge_source &&
        other.createdAt == createdAt &&
        other.id == id &&
        mapEquals(other.metadata, metadata) &&
        other.call_back_url == call_back_url &&
        other.app_id == app_id &&
        other.userId == userId &&
        other.chargeId == chargeId &&
        other.v == v;
  }

  @override
  int get hashCode {
    return customer.hashCode ^
        billing.hashCode ^
        status.hashCode ^
        ref_id.hashCode ^
        payments.hashCode ^
        charge_source.hashCode ^
        createdAt.hashCode ^
        id.hashCode ^
        metadata.hashCode ^
        call_back_url.hashCode ^
        app_id.hashCode ^
        userId.hashCode ^
        chargeId.hashCode ^
        v.hashCode;
  }
}
