// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rewardpoint.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class rewardpointAdapter extends TypeAdapter<rewardpoint> {
  @override
  final int typeId = 82;

  @override
  rewardpoint read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return rewardpoint(
      fields[90] as double,
    );
  }

  @override
  void write(BinaryWriter writer, rewardpoint obj) {
    writer
      ..writeByte(1)
      ..writeByte(90)
      ..write(obj.point);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is rewardpointAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
