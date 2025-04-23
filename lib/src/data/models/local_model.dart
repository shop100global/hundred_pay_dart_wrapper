import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class LocalModel extends LocalEntity {
  LocalModel({super.amount, super.currency});

  LocalModel copyWith({String? amount, String? currency}) {
    return LocalModel(
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (currency != null) {
      result.addAll({'currency': currency});
    }

    return result;
  }

  factory LocalModel.fromMap(Map<String, dynamic> map) {
    return LocalModel(amount: map['amount'], currency: map['currency']);
  }

  String toJson() => json.encode(toMap());

  factory LocalModel.fromJson(String source) =>
      LocalModel.fromMap(json.decode(source));

  @override
  String toString() => 'LocalModel(amount: $amount, currency: $currency)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is LocalModel &&
        other.amount == amount &&
        other.currency == currency;
  }

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode;
}
