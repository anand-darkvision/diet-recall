// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'water.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WaterAdapter extends TypeAdapter<Water> {
  @override
  final int typeId = 81;

  @override
  Water read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Water(
      fields[81] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Water obj) {
    writer
      ..writeByte(1)
      ..writeByte(81)
      ..write(obj.water);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WaterAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
