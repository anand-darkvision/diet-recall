// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dinner_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DinnerContactAdapter extends TypeAdapter<Dinner_Contact> {
  @override
  final int typeId = 2;

  @override
  Dinner_Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Dinner_Contact(
      fields[8] as String,
      fields[9] as int,
      fields[10] as String,
      fields[11] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Dinner_Contact obj) {
    writer
      ..writeByte(4)
      ..writeByte(8)
      ..write(obj.dinnerFood)
      ..writeByte(9)
      ..write(obj.dinnerServings)
      ..writeByte(10)
      ..write(obj.dinnerDrinks)
      ..writeByte(11)
      ..write(obj.dinnerGlass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DinnerContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
