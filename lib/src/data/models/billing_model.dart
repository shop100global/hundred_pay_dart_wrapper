import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class BillingModel extends BillingEntity {
  BillingModel({
    super.currency,
    super.vat,
    super.pricing_type,
    super.amount,
    super.description,
    super.country,
  });

  BillingModel copyWith({
    String? currency,
    num? vat,
    String? pricing_type,
    String? amount,
    String? description,
    String? country,
  }) {
    return BillingModel(
      currency: currency ?? this.currency,
      vat: vat ?? this.vat,
      pricing_type: pricing_type ?? this.pricing_type,
      amount: amount ?? this.amount,
      description: description ?? this.description,
      country: country ?? this.country,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (currency != null) {
      result.addAll({'currency': currency});
    }
    if (vat != null) {
      result.addAll({'vat': vat});
    }
    if (pricing_type != null) {
      result.addAll({'pricing_type': pricing_type});
    }
    if (amount != null) {
      result.addAll({'amount': amount});
    }
    if (description != null) {
      result.addAll({'description': description});
    }
    if (country != null) {
      result.addAll({'country': country});
    }

    return result;
  }

  factory BillingModel.fromMap(Map<String, dynamic> map) {
    return BillingModel(
      currency: map['currency'],
      vat: map['vat'],
      pricing_type: map['pricing_type'],
      amount: map['amount'],
      description: map['description'],
      country: map['country'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BillingModel.fromJson(String source) =>
      BillingModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BillingModel(currency: $currency, vat: $vat, pricing_type: $pricing_type, amount: $amount, description: $description, country: $country)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BillingModel &&
        other.currency == currency &&
        other.vat == vat &&
        other.pricing_type == pricing_type &&
        other.amount == amount &&
        other.description == description &&
        other.country == country;
  }

  @override
  int get hashCode {
    return currency.hashCode ^
        vat.hashCode ^
        pricing_type.hashCode ^
        amount.hashCode ^
        description.hashCode ^
        country.hashCode;
  }
}
