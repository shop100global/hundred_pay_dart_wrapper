import 'package:hundred_pay_hq_wrapper/hundred_pay_hq_wrapper.dart';

void main() {
  // HundredPayHqWrapperRepository(
  //   hundredPayHqWrapperDataProvider: HundredPayHqWrapperDataProvider(),
  // ).verifyPayment(transactionId: "67f3d5c25f9927011190755c");

  // HundredPayHqWrapperRepository(
  //   hundredPayHqWrapperDataProvider: HundredPayHqWrapperDataProvider(),
  // ).createSubAccount(
  //   symbols: ['USDT'],
  //   name: 'originalmiracleio2',
  //   email: 'miracleficient@gmail.com',
  //   phone: "+234813 515 5549",
  // );

  HundredPayHqWrapperRepository(
    hundredPayHqWrapperDataProvider: HundredPayHqWrapperDataProvider(),
  ).previewConversion(amount: "3", fromSymbol: "USDT", toSymbol: "NGN");
}
