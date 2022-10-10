// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'setting.g.dart';

@HiveType(typeId: 3)
class Setting extends HiveObject {
  @HiveField(0)
  bool isIntroSeen;

  Setting({
    required this.isIntroSeen,
  });

  Setting copyWith({
    bool? isIntroSeen,
  }) {
    return Setting(
      isIntroSeen: isIntroSeen ?? this.isIntroSeen,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isIntroSeen': isIntroSeen,
    };
  }

  factory Setting.fromMap(Map<String, dynamic> map) {
    return Setting(
      isIntroSeen: map['isIntroSeen'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Setting.fromJson(String source) => Setting.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Setting(isIntroSeen: $isIntroSeen)';

  @override
  bool operator ==(covariant Setting other) {
    if (identical(this, other)) return true;

    return other.isIntroSeen == isIntroSeen;
  }

  @override
  int get hashCode => isIntroSeen.hashCode;
}
