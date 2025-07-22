import 'package:hundred_pay_hq_wrapper/hundred_pay_hq_wrapper.dart';

void main() {
  HundredPayHqWrapperRepository(
    hundredPayHqWrapperDataProvider: HundredPayHqWrapperDataProvider(),
  ).verifyPayment(transactionId: "");

  HundredPayHqWrapperRepository(
    hundredPayHqWrapperDataProvider: HundredPayHqWrapperDataProvider(),
  ).createSubAccount(
    symbols: ['USDT'],
    name: '',
    email: '',
    phone: "",
  );

  HundredPayHqWrapperRepository(
    hundredPayHqWrapperDataProvider: HundredPayHqWrapperDataProvider(),
  ).previewConversion(amount: "3", fromSymbol: "USDT", toSymbol: "NGN");
}
