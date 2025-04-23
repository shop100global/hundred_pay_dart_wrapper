import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class CipherparamsModel extends CipherparamsEntity {
  CipherparamsModel({super.iv});

  CipherparamsModel copyWith({String? iv}) {
    return CipherparamsModel(iv: iv ?? this.iv);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (iv != null) {
      result.addAll({'iv': iv});
    }

    return result;
  }

  factory CipherparamsModel.fromMap(Map<String, dynamic> map) {
    return CipherparamsModel(iv: map['iv']);
  }

  String toJson() => json.encode(toMap());

  factory CipherparamsModel.fromJson(String source) =>
      CipherparamsModel.fromMap(json.decode(source));

  @override
  String toString() => 'CipherparamsModel(iv: $iv)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CipherparamsModel && other.iv == iv;
  }

  @override
  int get hashCode => iv.hashCode;
}
