import 'package:hundred_pay_hq_wrapper/src/src.dart';

class Threads {
  Future<VerifyEntity> verifyPayamentThread(dynamic response) {
    final parseUseCase = ParseUseCase<VerifyEntity>();
    return parseUseCase.execute(
      response,
      (data) => VerifyModel.fromMap(data as Map<String, dynamic>),
    );
  }

  Future<CreateSubAccountEntity> createSubAccountsThread(dynamic response) {
    final parseUseCase = ParseUseCase<CreateSubAccountEntity>();
    return parseUseCase.execute(
      response,
      (data) => CreateSubAccountModel.fromMap(data as Map<String, dynamic>),
    );
  }

  Future<PreviewConversionEntity> previewConversionThread(dynamic response) {
    final parseUseCase = ParseUseCase<PreviewConversionEntity>();
    return parseUseCase.execute(
      response,
      (data) => PreviewConversionModel.fromMap(data as Map<String, dynamic>),
    );
  }
}
