import 'dart:convert';
import 'dart:developer';

import 'package:hundred_pay_hq_wrapper/config/config.dart';
import 'package:hundred_pay_hq_wrapper/src/src.dart';

class HundredPayHqWrapperDataProvider {
  Future<dynamic> verifyPayment({required String transactionId}) async {
    final body = json.encode({"transactionId": transactionId});
    final req = await NetworkService.sendRequest(
      requestId: 'verifyPayment',
      requestType: RequestType.post,
      url: Endpoints.verifyRoute,
      body: body,
    );
    return NetworkHelper.filterResponse(
      callBack: (json) {
        print("response is $json");
        return (json);
      },
      response: req,
      onFailureCallBackWithMessage: (errType, msg) {
        print('error type is $errType');
        print('error message is $msg');
        throw msg.toString();
      },
    );
  }

  Future<dynamic> createSubAccount({
    required List<String> symbols,
    required String name,
    required String email,
    required String phone,
    Map<String, dynamic>? metadata,
  }) async {
    // 🔍 Validate each symbol against the enum values
    final invalidSymbols =
        symbols
            .where(
              (symbol) => !CurrenciesEnum.values.any((e) => e.value == symbol),
            )
            .toList();

    if (invalidSymbols.isNotEmpty) {
      throw ArgumentError(
        'Invalid currency symbol(s): ${invalidSymbols.join(', ')}',
      );
    }
    final owner = {"name": name, "email": email, "phone": phone};
    final body = json.encode({
      "symbols": symbols,
      "networks": ['bsc'],
      "owner": owner,
      "metadata": metadata ?? {},
    });
    final req = await NetworkService.sendRequest(
      requestId: 'createSubAccount',
      requestType: RequestType.post,
      url: Endpoints.subAccountRoute,
      body: body,
    );
    return NetworkHelper.filterResponse(
      callBack: (json) {
        print("response is $json");
        return (json);
      },
      response: req,
      onFailureCallBackWithMessage: (errType, msg) {
        print('error type is $errType');
        print('error message is $msg');
        throw msg.toString();
      },
    );
  }

  Future<dynamic> previewConversion({
    required String amount,
    required String fromSymbol,
    required String toSymbol,
  }) async {
    // Validate currency symbols before hitting the API
    final isValidFrom = CurrenciesEnum.values.any((e) => e.value == fromSymbol);
    final isValidTo = CurrenciesEnum.values.any((e) => e.value == toSymbol);

    if (!isValidFrom || !isValidTo) {
      throw ArgumentError(
        'Invalid currency symbol(s): '
        '${!isValidFrom ? 'fromSymbol=$fromSymbol ' : ''}'
        '${!isValidTo ? 'toSymbol=$toSymbol' : ''}',
      );
    }
    final body = json.encode({
      "amount": amount,
      "fromSymbol": fromSymbol,
      "toSymbol": toSymbol,
    });
    final req = await NetworkService.sendRequest(
      requestId: 'previewConversion',
      requestType: RequestType.post,
      url: Endpoints.conversionPreviewRoute,
      body: body,
    );
    return NetworkHelper.filterResponse(
      callBack: (json) {
        print("response is $json");
        return (json);
      },
      response: req,
      onFailureCallBackWithMessage: (errType, msg) {
        print('error type is $errType');
        print('error message is $msg');
        throw msg.toString();
      },
    );
  }
}
