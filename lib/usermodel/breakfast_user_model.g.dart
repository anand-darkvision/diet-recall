// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'breakfast_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BreakfastContactAdapter extends TypeAdapter<Breakfast_Contact> {
  @override
  final int typeId = 0;

  @override
  Breakfast_Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Breakfast_Contact(
      fields[0] as String,
      fields[1] as int,
      fields[2] as String,
      fields[3] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Breakfast_Contact obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.breakFastFood)
      ..writeByte(1)
      ..write(obj.breakFastServings)
      ..writeByte(2)
      ..write(obj.breakFastDrinks)
      ..writeByte(3)
      ..write(obj.breakFastGlass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BreakfastContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
