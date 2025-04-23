import 'dart:convert';

import 'package:hundred_pay_hq_wrapper/src/src.dart';

class BlockModel extends BlockEntity {
  BlockModel({super.height, super.hash});

  BlockModel copyWith({num? height, String? hash}) {
    return BlockModel(height: height ?? this.height, hash: hash ?? this.hash);
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (height != null) {
      result.addAll({'height': height});
    }
    if (hash != null) {
      result.addAll({'hash': hash});
    }

    return result;
  }

  factory BlockModel.fromMap(Map<String, dynamic> map) {
    return BlockModel(height: map['height'], hash: map['hash']);
  }

  String toJson() => json.encode(toMap());

  factory BlockModel.fromJson(String source) =>
      BlockModel.fromMap(json.decode(source));

  @override
  String toString() => 'BlockModel(height: $height, hash: $hash)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BlockModel && other.height == height && other.hash == hash;
  }

  @override
  int get hashCode => height.hashCode ^ hash.hashCode;
}
