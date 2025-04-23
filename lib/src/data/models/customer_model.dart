import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class CustomerModel extends CustomerEntity {
  CustomerModel({super.user_id, super.name, super.email, super.phone});

  CustomerModel copyWith({
    String? user_id,
    String? name,
    String? email,
    String? phone,
  }) {
    return CustomerModel(
      user_id: user_id ?? this.user_id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (user_id != null) {
      result.addAll({'user_id': user_id});
    }
    if (name != null) {
      result.addAll({'name': name});
    }
    if (email != null) {
      result.addAll({'email': email});
    }
    if (phone != null) {
      result.addAll({'phone': phone});
    }

    return result;
  }

  factory CustomerModel.fromMap(Map<String, dynamic> map) {
    return CustomerModel(
      user_id: map['user_id'],
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomerModel.fromJson(String source) =>
      CustomerModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CustomerModel(user_id: $user_id, name: $name, email: $email, phone: $phone)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CustomerModel &&
        other.user_id == user_id &&
        other.name == name &&
        other.email == email &&
        other.phone == phone;
  }

  @override
  int get hashCode {
    return user_id.hashCode ^ name.hashCode ^ email.hashCode ^ phone.hashCode;
  }
}
