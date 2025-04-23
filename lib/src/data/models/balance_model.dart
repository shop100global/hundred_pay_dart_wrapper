import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class BalanceModel extends BalanceEntity {
  BalanceModel({super.available, super.locked});

  BalanceModel copyWith({num? available, num? locked}) {
    return BalanceModel(
      available: available ?? this.available,
      locked: locked ?? this.locked,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (available != null) {
      result.addAll({'available': available});
    }
    if (locked != null) {
      result.addAll({'locked': locked});
    }

    return result;
  }

  factory BalanceModel.fromMap(Map<String, dynamic> map) {
    return BalanceModel(available: map['available'], locked: map['locked']);
  }

  String toJson() => json.encode(toMap());

  factory BalanceModel.fromJson(String source) =>
      BalanceModel.fromMap(json.decode(source));

  @override
  String toString() => 'BalanceModel(available: $available, locked: $locked)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BalanceModel &&
        other.available == available &&
        other.locked == locked;
  }

  @override
  int get hashCode => available.hashCode ^ locked.hashCode;
}
