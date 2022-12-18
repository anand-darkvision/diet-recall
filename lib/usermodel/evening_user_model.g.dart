// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'evening_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class eveningContactAdapter extends TypeAdapter<evening_Contact> {
  @override
  final int typeId = 3;

  @override
  evening_Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return evening_Contact(
      fields[12] as String,
      fields[13] as int,
      fields[14] as String,
      fields[15] as int,
    );
  }

  @override
  void write(BinaryWriter writer, evening_Contact obj) {
    writer
      ..writeByte(4)
      ..writeByte(12)
      ..write(obj.eveningFood)
      ..writeByte(13)
      ..write(obj.eveningServings)
      ..writeByte(14)
      ..write(obj.eveningDrinks)
      ..writeByte(15)
      ..write(obj.eveningGlass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is eveningContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
