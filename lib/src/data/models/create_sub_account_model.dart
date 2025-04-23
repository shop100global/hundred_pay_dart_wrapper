import 'dart:convert';
import 'package:hundred_pay_hq_wrapper/src/src.dart';
import 'package:collection/collection.dart';

final listEquals2 = const ListEquality().equals;

class CreateSubAccountModel extends CreateSubAccountEntity {
  @override
  final List<SubAccountsModel>? accounts;
  CreateSubAccountModel({super.message, this.accounts})
    : super(accounts: accounts);

  CreateSubAccountModel copyWith({
    String? message,
    List<SubAccountsModel>? accounts,
  }) {
    return CreateSubAccountModel(
      message: message ?? this.message,
      accounts: accounts ?? this.accounts,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (message != null) {
      result.addAll({'message': message});
    }
    if (accounts != null) {
      result.addAll({'accounts': accounts!.map((x) => x.toMap()).toList()});
    }

    return result;
  }

  factory CreateSubAccountModel.fromMap(Map<String, dynamic> map) {
    return CreateSubAccountModel(
      message: map['message'],
      accounts:
          map['accounts'] != null
              ? List<SubAccountsModel>.from(
                map['accounts']?.map((x) => SubAccountsModel.fromMap(x)),
              )
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateSubAccountModel.fromJson(String source) =>
      CreateSubAccountModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'CreateSubAccountModel(message: $message, accounts: $accounts)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateSubAccountModel &&
        other.message == message &&
        listEquals2(other.accounts, accounts);
  }

  @override
  int get hashCode => message.hashCode ^ accounts.hashCode;
}
