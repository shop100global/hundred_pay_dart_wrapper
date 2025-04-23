import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class PreviewConversionModel extends PreviewConversionEntity {
  PreviewConversionModel({
    super.convertedAmount,
    super.totalAmount,
    super.feeInUSD,
    super.feeInToCurrency,
    super.feeInFromCurrency,
    super.conversionFeeInUSD,
    super.conversionFeeInToCurrency,
    super.conversionFeeInFromCurrency,
    super.fromRate,
    super.toRate,
    super.intermediateUSDAmount,
  });

  PreviewConversionModel copyWith({
    num? convertedAmount,
    num? totalAmount,
    num? feeInUSD,
    num? feeInToCurrency,
    num? feeInFromCurrency,
    num? conversionFeeInUSD,
    num? conversionFeeInToCurrency,
    num? conversionFeeInFromCurrency,
    num? fromRate,
    num? toRate,
    num? intermediateUSDAmount,
  }) {
    return PreviewConversionModel(
      convertedAmount: convertedAmount ?? this.convertedAmount,
      totalAmount: totalAmount ?? this.totalAmount,
      feeInUSD: feeInUSD ?? this.feeInUSD,
      feeInToCurrency: feeInToCurrency ?? this.feeInToCurrency,
      feeInFromCurrency: feeInFromCurrency ?? this.feeInFromCurrency,
      conversionFeeInUSD: conversionFeeInUSD ?? this.conversionFeeInUSD,
      conversionFeeInToCurrency:
          conversionFeeInToCurrency ?? this.conversionFeeInToCurrency,
      conversionFeeInFromCurrency:
          conversionFeeInFromCurrency ?? this.conversionFeeInFromCurrency,
      fromRate: fromRate ?? this.fromRate,
      toRate: toRate ?? this.toRate,
      intermediateUSDAmount:
          intermediateUSDAmount ?? this.intermediateUSDAmount,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (convertedAmount != null) {
      result.addAll({'convertedAmount': convertedAmount});
    }
    if (totalAmount != null) {
      result.addAll({'totalAmount': totalAmount});
    }
    if (feeInUSD != null) {
      result.addAll({'feeInUSD': feeInUSD});
    }
    if (feeInToCurrency != null) {
      result.addAll({'feeInToCurrency': feeInToCurrency});
    }
    if (feeInFromCurrency != null) {
      result.addAll({'feeInFromCurrency': feeInFromCurrency});
    }
    if (conversionFeeInUSD != null) {
      result.addAll({'conversionFeeInUSD': conversionFeeInUSD});
    }
    if (conversionFeeInToCurrency != null) {
      result.addAll({'conversionFeeInToCurrency': conversionFeeInToCurrency});
    }
    if (conversionFeeInFromCurrency != null) {
      result.addAll({
        'conversionFeeInFromCurrency': conversionFeeInFromCurrency,
      });
    }
    if (fromRate != null) {
      result.addAll({'fromRate': fromRate});
    }
    if (toRate != null) {
      result.addAll({'toRate': toRate});
    }
    if (intermediateUSDAmount != null) {
      result.addAll({'intermediateUSDAmount': intermediateUSDAmount});
    }

    return result;
  }

  factory PreviewConversionModel.fromMap(Map<String, dynamic> map) {
    return PreviewConversionModel(
      convertedAmount: map['convertedAmount'],
      totalAmount: map['totalAmount'],
      feeInUSD: map['feeInUSD'],
      feeInToCurrency: map['feeInToCurrency'],
      feeInFromCurrency: map['feeInFromCurrency'],
      conversionFeeInUSD: map['conversionFeeInUSD'],
      conversionFeeInToCurrency: map['conversionFeeInToCurrency'],
      conversionFeeInFromCurrency: map['conversionFeeInFromCurrency'],
      fromRate: map['fromRate'],
      toRate: map['toRate'],
      intermediateUSDAmount: map['intermediateUSDAmount'],
    );
  }

  String toJson() => json.encode(toMap());

  factory PreviewConversionModel.fromJson(String source) =>
      PreviewConversionModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PreviewConversionModel(convertedAmount: $convertedAmount, totalAmount: $totalAmount, feeInUSD: $feeInUSD, feeInToCurrency: $feeInToCurrency, feeInFromCurrency: $feeInFromCurrency, conversionFeeInUSD: $conversionFeeInUSD, conversionFeeInToCurrency: $conversionFeeInToCurrency, conversionFeeInFromCurrency: $conversionFeeInFromCurrency, fromRate: $fromRate, toRate: $toRate, intermediateUSDAmount: $intermediateUSDAmount)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PreviewConversionModel &&
        other.convertedAmount == convertedAmount &&
        other.totalAmount == totalAmount &&
        other.feeInUSD == feeInUSD &&
        other.feeInToCurrency == feeInToCurrency &&
        other.feeInFromCurrency == feeInFromCurrency &&
        other.conversionFeeInUSD == conversionFeeInUSD &&
        other.conversionFeeInToCurrency == conversionFeeInToCurrency &&
        other.conversionFeeInFromCurrency == conversionFeeInFromCurrency &&
        other.fromRate == fromRate &&
        other.toRate == toRate &&
        other.intermediateUSDAmount == intermediateUSDAmount;
  }

  @override
  int get hashCode {
    return convertedAmount.hashCode ^
        totalAmount.hashCode ^
        feeInUSD.hashCode ^
        feeInToCurrency.hashCode ^
        feeInFromCurrency.hashCode ^
        conversionFeeInUSD.hashCode ^
        conversionFeeInToCurrency.hashCode ^
        conversionFeeInFromCurrency.hashCode ^
        fromRate.hashCode ^
        toRate.hashCode ^
        intermediateUSDAmount.hashCode;
  }
}
