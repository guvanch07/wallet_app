// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text_object.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextObjectAdapter extends TypeAdapter<TextObject> {
  @override
  final int typeId = 1;

  @override
  TextObject read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextObject(
      name: fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, TextObject obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextObjectAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
