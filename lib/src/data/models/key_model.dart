import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class KeyModel extends KeyEntity {
  @override
  final CreateSubaccountCryptoModel? crypto;
  KeyModel({super.version, super.id, super.address, this.crypto})
    : super(crypto: crypto);

  KeyModel copyWith({
    num? version,
    String? id,
    String? address,
    CreateSubaccountCryptoModel? crypto,
  }) {
    return KeyModel(
      version: version ?? this.version,
      id: id ?? this.id,
      address: address ?? this.address,
      crypto: crypto ?? this.crypto,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (version != null) {
      result.addAll({'version': version});
    }
    if (id != null) {
      result.addAll({'id': id});
    }
    if (address != null) {
      result.addAll({'address': address});
    }
    if (crypto != null) {
      result.addAll({'crypto': crypto!.toMap()});
    }

    return result;
  }

  factory KeyModel.fromMap(Map<String, dynamic> map) {
    return KeyModel(
      version: map['version'],
      id: map['id'],
      address: map['address'],
      crypto:
          map['crypto'] != null
              ? CreateSubaccountCryptoModel.fromMap(map['crypto'])
              : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory KeyModel.fromJson(String source) =>
      KeyModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'KeyModel(version: $version, id: $id, address: $address, crypto: $crypto)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is KeyModel &&
        other.version == version &&
        other.id == id &&
        other.address == address &&
        other.crypto == crypto;
  }

  @override
  int get hashCode {
    return version.hashCode ^ id.hashCode ^ address.hashCode ^ crypto.hashCode;
  }
}
