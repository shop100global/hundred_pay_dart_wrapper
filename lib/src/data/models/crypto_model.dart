import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class CryptoModel extends CryptoEntity {
  CryptoModel({super.amount, super.currency});

  CryptoModel copyWith({num? amount, String? currency}) {
    return CryptoModel(
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

  factory CryptoModel.fromMap(Map<String, dynamic> map) {
    return CryptoModel(amount: map['amount'], currency: map['currency']);
  }

  String toJson() => json.encode(toMap());

  factory CryptoModel.fromJson(String source) =>
      CryptoModel.fromMap(json.decode(source));

  @override
  String toString() => 'CryptoModel(amount: $amount, currency: $currency)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CryptoModel &&
        other.amount == amount &&
        other.currency == currency;
  }

  @override
  int get hashCode => amount.hashCode ^ currency.hashCode;
}
