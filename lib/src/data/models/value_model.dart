import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class ValueModel extends ValueEntity {
  @override
  final CryptoModel? crypto;
  @override
  final LocalModel? local;
  ValueModel({this.crypto, this.local}) : super(crypto: crypto, local: local);

  ValueModel copyWith({CryptoModel? crypto, LocalModel? local}) {
    return ValueModel(
      crypto: crypto ?? this.crypto,
      local: local ?? this.local,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (crypto != null) {
      result.addAll({'crypto': crypto!.toMap()});
    }
    if (local != null) {
      result.addAll({'local': local!.toMap()});
    }

    return result;
  }

  factory ValueModel.fromMap(Map<String, dynamic> map) {
    return ValueModel(
      crypto: map['crypto'] != null ? CryptoModel.fromMap(map['crypto']) : null,
      local: map['local'] != null ? LocalModel.fromMap(map['local']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ValueModel.fromJson(String source) =>
      ValueModel.fromMap(json.decode(source));

  @override
  String toString() => 'ValueModel(crypto: $crypto, local: $local)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ValueModel &&
        other.crypto == crypto &&
        other.local == local;
  }

  @override
  int get hashCode => crypto.hashCode ^ local.hashCode;
}
