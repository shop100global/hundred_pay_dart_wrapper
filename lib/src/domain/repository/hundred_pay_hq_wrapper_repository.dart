import 'dart:developer';

import 'package:hundred_pay_hq_wrapper/config/config.dart';
import 'package:hundred_pay_hq_wrapper/src/src.dart';

class HundredPayHqWrapperRepository {
  final HundredPayHqWrapperDataProvider _hundredPayHqWrapperDataProvider;

  HundredPayHqWrapperRepository({
    required HundredPayHqWrapperDataProvider hundredPayHqWrapperDataProvider,
  }) : _hundredPayHqWrapperDataProvider = hundredPayHqWrapperDataProvider;
  Future<VerifyEntity> verifyPayment({required String transactionId}) async {
    try {
      final res = await _hundredPayHqWrapperDataProvider.verifyPayment(
        transactionId: transactionId,
      );
      return Threads().verifyPayamentThread(res);
    } catch (error, stackTrace) {
      print("error is $error,");
      print("error is located at $stackTrace");
      throw error.toString();
    }
  }

  Future<CreateSubAccountEntity> createSubAccount({
    required List<String> symbols,
    required String name,
    required String email,
    required String phone,
    Map<String, dynamic>? metadata,
  }) async {
    try {
      final res = await _hundredPayHqWrapperDataProvider.createSubAccount(
        symbols: symbols,
        name: name,
        email: email,
        phone: phone,
        metadata: metadata,
      );
      return Threads().createSubAccountsThread(res);
    } catch (error, stackTrace) {
      print("error is $error,");
      print("error is located at $stackTrace");
      throw error.toString();
    }
  }

  Future<PreviewConversionEntity> previewConversion({
    required String amount,
    required String fromSymbol,
    required String toSymbol,
  }) async {
    try {
      final res = await _hundredPayHqWrapperDataProvider.previewConversion(
        amount: amount,
        fromSymbol: fromSymbol,
        toSymbol: toSymbol,
      );
      return Threads().previewConversionThread(res);
    } catch (error, stackTrace) {
      print("error is $error,");
      print("error is located at $stackTrace");
      throw error.toString();
    }
  }
}
