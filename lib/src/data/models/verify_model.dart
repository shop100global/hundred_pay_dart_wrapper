import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class VerifyModel extends VerifyEntity {
  @override
  final VerifyDataModel? data;
  VerifyModel({super.status, this.data}) : super(data: data);

  VerifyModel copyWith({String? status, VerifyDataModel? data}) {
    return VerifyModel(status: status ?? this.status, data: data ?? this.data);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (status != null) {
      result.addAll({'status': status});
    }
    if (data != null) {
      result.addAll({'data': data!.toMap()});
    }

    return result;
  }

  factory VerifyModel.fromMap(Map<String, dynamic> map) {
    return VerifyModel(
      status: map['status'],
      data: map['data'] != null ? VerifyDataModel.fromMap(map['data']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory VerifyModel.fromJson(String source) =>
      VerifyModel.fromMap(json.decode(source));

  @override
  String toString() => 'VerifyModel(status: $status, data: $data)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is VerifyModel && other.status == status && other.data == data;
  }

  @override
  int get hashCode => status.hashCode ^ data.hashCode;
}
