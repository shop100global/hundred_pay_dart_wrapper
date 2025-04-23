class PreviewConversionEntity {
  final num? convertedAmount;
  final num? totalAmount;
  final num? feeInUSD;
  final num? feeInToCurrency;
  final num? feeInFromCurrency;
  final num? conversionFeeInUSD;
  final num? conversionFeeInToCurrency;
  final num? conversionFeeInFromCurrency;
  final num? fromRate;
  final num? toRate;
  final num? intermediateUSDAmount;

  PreviewConversionEntity({
    this.convertedAmount,
    this.totalAmount,
    this.feeInUSD,
    this.feeInToCurrency,
    this.feeInFromCurrency,
    this.conversionFeeInUSD,
    this.conversionFeeInToCurrency,
    this.conversionFeeInFromCurrency,
    this.fromRate,
    this.toRate,
    this.intermediateUSDAmount,
  });
}
