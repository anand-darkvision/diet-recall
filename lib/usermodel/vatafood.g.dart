// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vatafood.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VataFoodcContactAdapter extends TypeAdapter<VataFoodcContact> {
  @override
  final int typeId = 80;

  @override
  VataFoodcContact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VataFoodcContact(
      fields[80] as String,
      fields[81] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VataFoodcContact obj) {
    writer
      ..writeByte(2)
      ..writeByte(80)
      ..write(obj.vatafoodName)
      ..writeByte(81)
      ..write(obj.vataFoodTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VataFoodcContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
