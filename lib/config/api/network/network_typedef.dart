import 'network_enums.dart';

typedef NetworkCallBack<R> = R Function(
  dynamic json,
);
typedef NetworkOnFailureCallBackWithMessage<R> = R Function(
    NetworkResponseErrorType errType, String? msg);
