import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class KdfparamsModel extends KdfparamsEntity {
  KdfparamsModel({super.dklen, super.salt, super.n, super.r, super.p});

  KdfparamsModel copyWith({num? dklen, String? salt, num? n, num? r, num? p}) {
    return KdfparamsModel(
      dklen: dklen ?? this.dklen,
      salt: salt ?? this.salt,
      n: n ?? this.n,
      r: r ?? this.r,
      p: p ?? this.p,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (dklen != null) {
      result.addAll({'dklen': dklen});
    }
    if (salt != null) {
      result.addAll({'salt': salt});
    }
    if (n != null) {
      result.addAll({'n': n});
    }
    if (r != null) {
      result.addAll({'r': r});
    }
    if (p != null) {
      result.addAll({'p': p});
    }

    return result;
  }

  factory KdfparamsModel.fromMap(Map<String, dynamic> map) {
    return KdfparamsModel(
      dklen: map['dklen'],
      salt: map['salt'],
      n: map['n'],
      r: map['r'],
      p: map['p'],
    );
  }

  String toJson() => json.encode(toMap());

  factory KdfparamsModel.fromJson(String source) =>
      KdfparamsModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KdfparamsModel(dklen: $dklen, salt: $salt, n: $n, r: $r, p: $p)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KdfparamsModel &&
        other.dklen == dklen &&
        other.salt == salt &&
        other.n == n &&
        other.r == r &&
        other.p == p;
  }

  @override
  int get hashCode {
    return dklen.hashCode ^
        salt.hashCode ^
        n.hashCode ^
        r.hashCode ^
        p.hashCode;
  }
}
