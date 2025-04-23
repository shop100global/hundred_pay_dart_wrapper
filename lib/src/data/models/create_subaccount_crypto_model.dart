import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class CreateSubaccountCryptoModel extends CreateSubaccountCryptoEntity {
  @override
  final CipherparamsModel? cipherparams;
  @override
  final KdfparamsModel? kdfparams;

  CreateSubaccountCryptoModel({
    super.ciphertext,
    this.cipherparams,
    super.cipher,
    super.kdf,
    this.kdfparams,
    super.mac,
  }) : super(cipherparams: cipherparams, kdfparams: kdfparams);

  CreateSubaccountCryptoModel copyWith({
    String? ciphertext,
    CipherparamsModel? cipherparams,
    String? cipher,
    String? kdf,
    KdfparamsModel? kdfparams,
    String? mac,
  }) {
    return CreateSubaccountCryptoModel(
      ciphertext: ciphertext ?? this.ciphertext,
      cipherparams: cipherparams ?? this.cipherparams,
      cipher: cipher ?? this.cipher,
      kdf: kdf ?? this.kdf,
      kdfparams: kdfparams ?? this.kdfparams,
      mac: mac ?? this.mac,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (ciphertext != null) {
      result.addAll({'ciphertext': ciphertext});
    }
    if (cipherparams != null) {
      result.addAll({'cipherparams': cipherparams!.toMap()});
    }
    if (cipher != null) {
      result.addAll({'cipher': cipher});
    }
    if (kdf != null) {
      result.addAll({'kdf': kdf});
    }
    if (kdfparams != null) {
      result.addAll({'kdfparams': kdfparams!.toMap()});
    }
    if (mac != null) {
      result.addAll({'mac': mac});
    }

    return result;
  }

  factory CreateSubaccountCryptoModel.fromMap(Map<String, dynamic> map) {
    return CreateSubaccountCryptoModel(
      ciphertext: map['ciphertext'],
      cipherparams:
          map['cipherparams'] != null
              ? CipherparamsModel.fromMap(map['cipherparams'])
              : null,
      cipher: map['cipher'],
      kdf: map['kdf'],
      kdfparams:
          map['kdfparams'] != null
              ? KdfparamsModel.fromMap(map['kdfparams'])
              : null,
      mac: map['mac'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CreateSubaccountCryptoModel.fromJson(String source) =>
      CreateSubaccountCryptoModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CreateSubaccountCryptoModel(ciphertext: $ciphertext, cipherparams: $cipherparams, cipher: $cipher, kdf: $kdf, kdfparams: $kdfparams, mac: $mac)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CreateSubaccountCryptoModel &&
        other.ciphertext == ciphertext &&
        other.cipherparams == cipherparams &&
        other.cipher == cipher &&
        other.kdf == kdf &&
        other.kdfparams == kdfparams &&
        other.mac == mac;
  }

  @override
  int get hashCode {
    return ciphertext.hashCode ^
        cipherparams.hashCode ^
        cipher.hashCode ^
        kdf.hashCode ^
        kdfparams.hashCode ^
        mac.hashCode;
  }
}
