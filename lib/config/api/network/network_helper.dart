import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import 'network.dart';

class NetworkHelper {
  const NetworkHelper._();

  static Future<R> filterResponse<R>({
    required NetworkCallBack callBack,
    required http.Response? response,
    required NetworkOnFailureCallBackWithMessage onFailureCallBackWithMessage,
    CallBackParameterName parameterName = CallBackParameterName.all,
  }) async {
    if (response == null) {
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.responseEmpty,
        'No response. Try again.',
      );
    }

    if (response.body.isEmpty || response.statusCode == 204) {
      return callBack('');
    }
    if (response.body.isEmpty || response.statusCode == 404) {
      final decorator = {'message': response.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.badRequest,
        decorator['message'] ?? 'Invalid request.',
      );
      // callBack(response.body);
    }
    if (response.body.isEmpty && response.statusCode == 500) {
      final decorator = {'message': response.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.serverError,
        decorator['message'] ?? 'Server error. Try later.',
      );
    }
    if (response.body.isEmpty && response.statusCode == 502) {
      final decorator = {'message': response.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.badGateway,
        decorator['message'] ?? 'Server unreachable.',
      );
    }

    if (response.body.isEmpty && response.statusCode == 503) {
      final decorator = {'message': response.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.serviceUnavailable,
        decorator['message'] ?? 'Service Unavailable',
      );
    }

    if (response.body.isEmpty && response.statusCode == 413) {
      final decorator = {'message': response.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.serviceUnavailable,
        decorator['message'] ?? 'Your request is too large',
      );
    }

    var json = jsonDecode(response.body);

    switch (response.statusCode) {
      case 200: // OK
      case 201: // Created
      case 202: // Accepted
        return callBack(parameterName.getJson(json));

      case 400: // Bad Request
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.badRequest,
          json['message'] ?? 'Invalid request.',
        );

      case 401: // Unauthorized
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.unauthorized,
          json['message'] ?? 'Unauthorized. Login required.',
        );

      case 403: // Forbidden
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.forbidden,
          json['message'] ?? 'Access denied.',
        );

      case 404: // Not Found
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.notFound,
          json['message'] ?? 'Resource not found.',
        );

      case 408: // Not Found
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.timeout,
          json['message'] ?? 'Request Timeout',
        );

      case 409: // Conflict
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.conflict,
          json['message'] ?? 'Conflict occurred.',
        );

      case 422: // Unprocessable Entity
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.unprocessableEntity,
          json['message'] ?? 'Invalid data.',
        );

      case 500: // Internal Server Error
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.serverError,
          json['message'] ?? 'Internal Server error. Try later.',
        );

      case 502: // Bad Gateway
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.badGateway,
          json['message'] ?? 'Server unreachable.',
        );

      case 503: // Bad Gateway
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.badGateway,
          json['message'] ?? 'Service Unavailable',
        );

      default:
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.didNotSucceed,
          json['message'] ?? 'Something went wrong.',
        );
    }
  }

  static Future<R> filterMultipartResponse<R>({
    required NetworkCallBack callBack,
    required http.StreamedResponse? response,
    required NetworkOnFailureCallBackWithMessage onFailureCallBackWithMessage,
    CallBackParameterName parameterName = CallBackParameterName.all,
  }) async {
    log('status is ${response?.statusCode} and msg of $response');

    if (response == null) {
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.responseEmpty,
        'No response. Try again.',
      );
    }

    var responseBody = await http.Response.fromStream(response);
    log('status is ${response.statusCode} and msg of ${responseBody.body}');
    if (responseBody.body.isEmpty) {
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.responseEmpty,
        'Response empty.',
      );
    }

    if (responseBody.body.isEmpty || response.statusCode == 204) {
      return callBack('');
    }
    if (responseBody.body.isEmpty && response.statusCode == 404) {
      final decorator = {'message': responseBody.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.badRequest,
        decorator['message'] ?? 'Invalid request.',
      );
      // callBack(response.body);
    }
    if (responseBody.body.isEmpty && response.statusCode == 500) {
      final decorator = {'message': responseBody.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.serverError,
        decorator['message'] ?? 'Server error. Try later.',
      );
    }
    if (responseBody.body.isEmpty && response.statusCode == 502) {
      final decorator = {'message': responseBody.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.badGateway,
        decorator['message'] ?? 'Server unreachable.',
      );
    }

    if (responseBody.body.isEmpty && response.statusCode == 503) {
      final decorator = {'message': responseBody.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.serviceUnavailable,
        decorator['message'] ?? 'Service Unavailable',
      );
    }

    if (responseBody.body.isEmpty && response.statusCode == 413) {
      final decorator = {'message': responseBody.body};
      return onFailureCallBackWithMessage(
        NetworkResponseErrorType.serviceUnavailable,
        decorator['message'] ?? 'Your request is too large',
      );
    }

    log('status is ${responseBody.statusCode}');
    var json = jsonDecode(responseBody.body);
    switch (responseBody.statusCode) {
      case 200: // OK
      case 201: // Created
      case 202: // Updated

        return callBack(parameterName.getJson(json));

      case 400: // Bad Request
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.badRequest,
          json['message'] ?? 'Invalid request.',
        );

      case 401: // Unauthorized
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.unauthorized,
          json['message'] ?? 'Unauthorized. Login required.',
        );

      case 403: // Forbidden
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.forbidden,
          json['message'] ?? 'Access denied.',
        );

      case 404: // Not Found
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.notFound,
          json['message'] ?? 'Resource not found.',
        );

      case 408: // Not Found
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.timeout,
          json['message'] ?? 'Request Timeout',
        );

      case 409: // Conflict
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.conflict,
          json['message'] ?? 'Conflict occurred.',
        );

      case 422: // Unprocessable Entity
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.unprocessableEntity,
          json['message'] ?? 'Invalid data.',
        );

      case 500: // Internal Server Error
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.serverError,
          json['message'] ?? 'Internal Server Error',
          // 'Server error. Try later.',
        );

      case 502: // Bad Gateway
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.badGateway,
          json['message'] ?? 'Server unreachable.',
        );

      case 503: // Bad Gateway
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.badGateway,
          json['message'] ?? 'Service Unavailable',
        );

      default:
        return onFailureCallBackWithMessage(
          NetworkResponseErrorType.didNotSucceed,
          json['message'] ?? 'Something went wrong.',
        );
    }
  }
}
