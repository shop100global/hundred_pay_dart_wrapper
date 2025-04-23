import 'package:hundred_pay_hq_wrapper/src/src.dart';

class CreateSubaccountCryptoEntity {
  final String? ciphertext;
  final CipherparamsEntity? cipherparams;
  final String? cipher;
  final String? kdf;
  final KdfparamsEntity? kdfparams;
  final String? mac;

  CreateSubaccountCryptoEntity({
    this.ciphertext,
    this.cipherparams,
    this.cipher,
    this.kdf,
    this.kdfparams,
    this.mac,
  });
}
