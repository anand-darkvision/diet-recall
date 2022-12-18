// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'lunch_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class lunchContactAdapter extends TypeAdapter<lunch_Contact> {
  @override
  final int typeId = 5;

  @override
  lunch_Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return lunch_Contact(
      fields[20] as String,
      fields[21] as int,
      fields[22] as String,
      fields[23] as int,
    );
  }

  @override
  void write(BinaryWriter writer, lunch_Contact obj) {
    writer
      ..writeByte(4)
      ..writeByte(20)
      ..write(obj.lunchFood)
      ..writeByte(21)
      ..write(obj.lunchServings)
      ..writeByte(22)
      ..write(obj.lunchDrinks)
      ..writeByte(23)
      ..write(obj.lunchGlass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is lunchContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
