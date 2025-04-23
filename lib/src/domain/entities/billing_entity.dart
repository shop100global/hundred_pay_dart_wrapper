class BillingEntity {
  final String? currency;
  final num? vat;
  final String? pricing_type;
  final String? amount;
  final String? description;
  final String? country;

  BillingEntity({
    this.currency,
    this.vat,
    this.pricing_type,
    this.amount,
    this.description,
    this.country,
  });
}
