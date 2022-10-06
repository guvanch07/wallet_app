// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

import 'package:wallet_app/data/audio_test.dart';
import 'package:wallet_app/data/text_object.dart';

part 'hive_data_model.g.dart';

@HiveType(typeId: 0)
class HiveTest {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final TextObject? textObject;
  @HiveField(2)
  final AudioTest? audioTest;
  HiveTest({
    required this.id,
    required this.textObject,
    required this.audioTest,
  });

  HiveTest copyWith({
    String? id,
    TextObject? textObject,
    AudioTest? audioTest,
  }) {
    return HiveTest(
      id: id ?? this.id,
      textObject: textObject ?? this.textObject,
      audioTest: audioTest ?? this.audioTest,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'textObject': textObject?.toMap(),
      'audioTest': audioTest?.toMap(),
    };
  }

  factory HiveTest.fromMap(Map<String, dynamic> map) {
    return HiveTest(
      id: map['id'] as String,
      textObject: map['textObject'] != null
          ? TextObject.fromMap(map['textObject'] as Map<String, dynamic>)
          : null,
      audioTest: map['audioTest'] != null
          ? AudioTest.fromMap(map['audioTest'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory HiveTest.fromJson(String source) =>
      HiveTest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'HiveTest(id: $id, textObject: $textObject, audioTest: $audioTest)';

  @override
  bool operator ==(covariant HiveTest other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.textObject == textObject &&
        other.audioTest == audioTest;
  }

  @override
  int get hashCode => id.hashCode ^ textObject.hashCode ^ audioTest.hashCode;
}
