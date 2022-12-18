// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moringsnack_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MorningsnackContactAdapter extends TypeAdapter<Morningsnack_Contact> {
  @override
  final int typeId = 6;

  @override
  Morningsnack_Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Morningsnack_Contact(
      fields[24] as String,
      fields[25] as int,
      fields[26] as String,
      fields[27] as int,
    );
  }

  @override
  void write(BinaryWriter writer, Morningsnack_Contact obj) {
    writer
      ..writeByte(4)
      ..writeByte(24)
      ..write(obj.morningSnackFood)
      ..writeByte(25)
      ..write(obj.morningSnackServings)
      ..writeByte(26)
      ..write(obj.morningSnackDrinks)
      ..writeByte(27)
      ..write(obj.morningSnackGlass);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MorningsnackContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
