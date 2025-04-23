import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class AccountModel extends AccountEntity {
  @override
  final KeyModel? key;
  AccountModel({super.address, super.network, this.key}) : super(key: key);

  AccountModel copyWith({String? address, String? network, KeyModel? key}) {
    return AccountModel(
      address: address ?? this.address,
      network: network ?? this.network,
      key: key ?? this.key,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (address != null) {
      result.addAll({'address': address});
    }
    if (network != null) {
      result.addAll({'network': network});
    }
    if (key != null) {
      result.addAll({'key': key!.toMap()});
    }

    return result;
  }

  factory AccountModel.fromMap(Map<String, dynamic> map) {
    return AccountModel(
      address: map['address'],
      network: map['network'],
      key: map['key'] != null ? KeyModel.fromMap(map['key']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AccountModel.fromJson(String source) =>
      AccountModel.fromMap(json.decode(source));

  @override
  String toString() =>
      'AccountModel(address: $address, network: $network, key: $key)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AccountModel &&
        other.address == address &&
        other.network == network &&
        other.key == key;
  }

  @override
  int get hashCode => address.hashCode ^ network.hashCode ^ key.hashCode;
}
