// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_test.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AudioTestAdapter extends TypeAdapter<AudioTest> {
  @override
  final int typeId = 2;

  @override
  AudioTest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AudioTest(
      lastname: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AudioTest obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.lastname);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AudioTestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
