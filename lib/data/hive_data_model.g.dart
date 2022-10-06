// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_data_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveTestAdapter extends TypeAdapter<HiveTest> {
  @override
  final int typeId = 0;

  @override
  HiveTest read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveTest(
      audioTest: fields[2] as AudioTest?,
      id: fields[0] as String,
      textObject: fields[1] as TextObject?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveTest obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.textObject)
      ..writeByte(2)
      ..write(obj.audioTest);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveTestAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
