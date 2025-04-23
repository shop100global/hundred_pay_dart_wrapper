import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class DataModel extends DataEntity {
  @override
  final ValueModel? value;
  @override
  final BlockModel? block;
  @override
  final ChargeModel? charge;
  DataModel({
    super.from,
    super.to,
    super.network,
    super.transaction_id,
    super.status,
    super.timestamp,
    this.value,
    this.block,
    this.charge,
    super.appId,
  });

  DataModel copyWith({
    String? from,
    String? to,
    String? network,
    String? transaction_id,
    String? status,
    DateTime? timestamp,
    ValueModel? value,
    BlockModel? block,
    ChargeModel? charge,
    String? appId,
  }) {
    return DataModel(
      from: from ?? this.from,
      to: to ?? this.to,
      network: network ?? this.network,
      transaction_id: transaction_id ?? this.transaction_id,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      value: value ?? this.value,
      block: block ?? this.block,
      charge: charge ?? this.charge,
      appId: appId ?? this.appId,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (from != null) {
      result.addAll({'from': from});
    }
    if (to != null) {
      result.addAll({'to': to});
    }
    if (network != null) {
      result.addAll({'network': network});
    }
    if (transaction_id != null) {
      result.addAll({'transaction_id': transaction_id});
    }
    if (status != null) {
      result.addAll({'status': status});
    }
    if (timestamp != null) {
      result.addAll({'timestamp': timestamp!.millisecondsSinceEpoch});
    }
    if (value != null) {
      result.addAll({'value': value!.toMap()});
    }
    if (block != null) {
      result.addAll({'block': block!.toMap()});
    }
    if (charge != null) {
      result.addAll({'charge': charge!.toMap()});
    }
    if (appId != null) {
      result.addAll({'appId': appId});
    }

    return result;
  }

  factory DataModel.fromMap(Map<String, dynamic> map) {
    return DataModel(
      from: map['from'],
      to: map['to'],
      network: map['network'],
      transaction_id: map['transaction_id'],
      status: map['status'],
      timestamp:
          map['timestamp'] != null ? DateTime.tryParse(map['timestamp']) : null,
      value: map['value'] != null ? ValueModel.fromMap(map['value']) : null,
      block: map['block'] != null ? BlockModel.fromMap(map['block']) : null,
      charge: map['charge'] != null ? ChargeModel.fromMap(map['charge']) : null,
      appId: map['appId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory DataModel.fromJson(String source) =>
      DataModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'DataModel(from: $from, to: $to, network: $network, transaction_id: $transaction_id, status: $status, timestamp: $timestamp, value: $value, block: $block, charge: $charge, appId: $appId)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DataModel &&
        other.from == from &&
        other.to == to &&
        other.network == network &&
        other.transaction_id == transaction_id &&
        other.status == status &&
        other.timestamp == timestamp &&
        other.value == value &&
        other.block == block &&
        other.charge == charge &&
        other.appId == appId;
  }

  @override
  int get hashCode {
    return from.hashCode ^
        to.hashCode ^
        network.hashCode ^
        transaction_id.hashCode ^
        status.hashCode ^
        timestamp.hashCode ^
        value.hashCode ^
        block.hashCode ^
        charge.hashCode ^
        appId.hashCode;
  }
}
