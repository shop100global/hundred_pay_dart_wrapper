import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class VerifyDataModel extends VerifyDataEntity {
  @override
  final DataModel? data;
  VerifyDataModel({
    super.retries,
    super.acknowledged,
    super.dispatched,
    super.type,
    super.id,
    super.chargeId,
    super.reference,
    this.data,
    super.cryptoChargeId,
    super.createdAt,
    super.v,
  }) : super(data: data);

  VerifyDataModel copyWith({
    num? retries,
    bool? acknowledged,
    bool? dispatched,
    String? type,
    String? id,
    String? chargeId,
    String? reference,
    DataModel? data,
    String? cryptoChargeId,
    DateTime? createdAt,
    num? v,
  }) {
    return VerifyDataModel(
      retries: retries ?? this.retries,
      acknowledged: acknowledged ?? this.acknowledged,
      dispatched: dispatched ?? this.dispatched,
      type: type ?? this.type,
      id: id ?? this.id,
      chargeId: chargeId ?? this.chargeId,
      reference: reference ?? this.reference,
      data: data ?? this.data,
      cryptoChargeId: cryptoChargeId ?? this.cryptoChargeId,
      createdAt: createdAt ?? this.createdAt,
      v: v ?? this.v,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (retries != null) {
      result.addAll({'retries': retries});
    }
    if (acknowledged != null) {
      result.addAll({'acknowledged': acknowledged});
    }
    if (dispatched != null) {
      result.addAll({'dispatched': dispatched});
    }
    if (type != null) {
      result.addAll({'type': type});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (chargeId != null) {
      result.addAll({'chargeId': chargeId});
    }
    if (reference != null) {
      result.addAll({'reference': reference});
    }
    if (data != null) {
      result.addAll({'data': data!.toMap()});
    }
    if (cryptoChargeId != null) {
      result.addAll({'cryptoChargeId': cryptoChargeId});
    }
    if (createdAt != null) {
      result.addAll({'createdAt': createdAt!.millisecondsSinceEpoch});
    }
    if (v != null) {
      result.addAll({'v': v});
    }

    return result;
  }

  factory VerifyDataModel.fromMap(Map<String, dynamic> map) {
    return VerifyDataModel(
      retries: map['retries'],
      acknowledged: map['acknowledged'],
      dispatched: map['dispatched'],
      type: map['type'],
      id: map['_id'],
      chargeId: map['chargeId'],
      reference: map['reference'],
      data: map['data'] != null ? DataModel.fromMap(map['data']) : null,
      cryptoChargeId: map['cryptoChargeId'],
      createdAt:
          map['createdAt'] != null ? DateTime.tryParse(map['createdAt']) : null,
      v: map['__v'],
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyDataModel.fromJson(String source) =>
      VerifyDataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VerifyDataModel(retries: $retries, acknowledged: $acknowledged, dispatched: $dispatched, type: $type, id: $id, chargeId: $chargeId, reference: $reference, data: $data, cryptoChargeId: $cryptoChargeId, createdAt: $createdAt, v: $v)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerifyDataModel &&
        other.retries == retries &&
        other.acknowledged == acknowledged &&
        other.dispatched == dispatched &&
        other.type == type &&
        other.id == id &&
        other.chargeId == chargeId &&
        other.reference == reference &&
        other.data == data &&
        other.cryptoChargeId == cryptoChargeId &&
        other.createdAt == createdAt &&
        other.v == v;
  }

  @override
  int get hashCode {
    return retries.hashCode ^
        acknowledged.hashCode ^
        dispatched.hashCode ^
        type.hashCode ^
        id.hashCode ^
        chargeId.hashCode ^
        reference.hashCode ^
        data.hashCode ^
        cryptoChargeId.hashCode ^
        createdAt.hashCode ^
        v.hashCode;
  }
}
