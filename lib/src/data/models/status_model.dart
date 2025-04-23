import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class StatusModel extends StatusEntity {
  @override
  final ContextModel? context;

  StatusModel({this.context, super.value, super.total_paid})
    : super(context: context);

  StatusModel copyWith({
    ContextModel? context,
    String? value,
    num? total_paid,
  }) {
    return StatusModel(
      context: context ?? this.context,
      value: value ?? this.value,
      total_paid: total_paid ?? this.total_paid,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (context != null) {
      result.addAll({'context': context!.toMap()});
    }
    if (value != null) {
      result.addAll({'value': value});
    }
    if (total_paid != null) {
      result.addAll({'total_paid': total_paid});
    }

    return result;
  }

  factory StatusModel.fromMap(Map<String, dynamic> map) {
    return StatusModel(
      context:
          map['context'] != null ? ContextModel.fromMap(map['context']) : null,
      value: map['value'],
      total_paid: map['total_paid'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StatusModel.fromJson(String source) =>
      StatusModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'StatusModel(context: $context, value: $value, total_paid: $total_paid)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is StatusModel &&
        other.context == context &&
        other.value == value &&
        other.total_paid == total_paid;
  }

  @override
  int get hashCode => context.hashCode ^ value.hashCode ^ total_paid.hashCode;
}
