// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bodytype.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class bodytypeContactAdapter extends TypeAdapter<bodytype_Contact> {
  @override
  final int typeId = 15;

  @override
  bodytype_Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return bodytype_Contact(
      (fields[60] as List).cast<double>(),
    );
  }

  @override
  void write(BinaryWriter writer, bodytype_Contact obj) {
    writer
      ..writeByte(1)
      ..writeByte(60)
      ..write(obj.bodyt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is bodytypeContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
