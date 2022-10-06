// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive/hive.dart';

part 'audio_test.g.dart';

@HiveType(typeId: 2)
class AudioTest {
  @HiveField(0)
  final String lastname;
  // @HiveField(1)
  // final SubAudioTest subAudioTest;
  AudioTest({
    //required this.subAudioTest,
    required this.lastname,
  });

  AudioTest copyWith({
    String? lastname,
  }) {
    return AudioTest(
      lastname: lastname ?? this.lastname,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'lastname': lastname,
    };
  }

  factory AudioTest.fromMap(Map<String, dynamic> map) {
    return AudioTest(
      lastname: map['lastname'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AudioTest.fromJson(String source) =>
      AudioTest.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AudioTest(lastname: $lastname)';

  @override
  bool operator ==(covariant AudioTest other) {
    if (identical(this, other)) return true;

    return other.lastname == lastname;
  }

  @override
  int get hashCode => lastname.hashCode;
}

// @HiveType(typeId: 3)
// class SubAudioTest extends ObjectDatabase {
//   @HiveField(0)
//   final String subAudio;
//   SubAudioTest({
//     required this.subAudio,
//   });
// }
