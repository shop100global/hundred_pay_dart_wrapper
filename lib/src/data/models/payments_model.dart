import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class PaymentsModel extends PaymentsEntity {
  @override
  final ValueModel? value;
  @override
  final BlockModel? block;
  PaymentsModel({
    super.from,
    super.to,
    super.network,
    super.transaction_id,
    super.status,
    super.timestamp,
    this.value,
    this.block,
  }) : super(value: value, block: block);

  PaymentsModel copyWith({
    String? from,
    String? to,
    String? network,
    String? transaction_id,
    String? status,
    DateTime? timestamp,
    ValueModel? value,
    BlockModel? block,
  }) {
    return PaymentsModel(
      from: from ?? this.from,
      to: to ?? this.to,
      network: network ?? this.network,
      transaction_id: transaction_id ?? this.transaction_id,
      status: status ?? this.status,
      timestamp: timestamp ?? this.timestamp,
      value: value ?? this.value,
      block: block ?? this.block,
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

    return result;
  }

  factory PaymentsModel.fromMap(Map<String, dynamic> map) {
    return PaymentsModel(
      from: map['from'],
      to: map['to'],
      network: map['network'],
      transaction_id: map['transaction_id'],
      status: map['status'],
      timestamp:
          map['timestamp'] != null ? DateTime.tryParse(map['timestamp']) : null,
      value: map['value'] != null ? ValueModel.fromMap(map['value']) : null,
      block: map['block'] != null ? BlockModel.fromMap(map['block']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PaymentsModel.fromJson(String source) =>
      PaymentsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PaymentsModel(from: $from, to: $to, network: $network, transaction_id: $transaction_id, status: $status, timestamp: $timestamp, value: $value, block: $block)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PaymentsModel &&
        other.from == from &&
        other.to == to &&
        other.network == network &&
        other.transaction_id == transaction_id &&
        other.status == status &&
        other.timestamp == timestamp &&
        other.value == value &&
        other.block == block;
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
        block.hashCode;
  }
}
