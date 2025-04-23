import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class ContextModel extends ContextEntity {
  ContextModel({super.status, super.value});

  ContextModel copyWith({String? status, num? value}) {
    return ContextModel(
      status: status ?? this.status,
      value: value ?? this.value,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status});
    }
    if (value != null) {
      result.addAll({'value': value});
    }

    return result;
  }

  factory ContextModel.fromMap(Map<String, dynamic> map) {
    return ContextModel(status: map['status'], value: map['value']);
  }

  String toJson() => json.encode(toMap());

  factory ContextModel.fromJson(String source) =>
      ContextModel.fromMap(json.decode(source));

  @override
  String toString() => 'ContextModel(status: $status, value: $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ContextModel &&
        other.status == status &&
        other.value == value;
  }

  @override
  int get hashCode => status.hashCode ^ value.hashCode;
}
