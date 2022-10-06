// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'text_object.g.dart';

@HiveType(typeId: 1)
class TextObject {
  @HiveField(0)
  final String name;
  TextObject({
    required this.name,
  });

  TextObject copyWith({
    String? name,
  }) {
    return TextObject(
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
    };
  }

  factory TextObject.fromMap(Map<String, dynamic> map) {
    return TextObject(
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextObject.fromJson(String source) =>
      TextObject.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TextObject(name: $name)';

  @override
  bool operator ==(covariant TextObject other) {
    if (identical(this, other)) return true;

    return other.name == name;
  }

  @override
  int get hashCode => name.hashCode;
}
