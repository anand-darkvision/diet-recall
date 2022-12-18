// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'warning_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WarningContactAdapter extends TypeAdapter<Warning_Contact> {
  @override
  final int typeId = 9;

  @override
  Warning_Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Warning_Contact(
      fields[46] as int,
      fields[47] as int,
      fields[48] as int,
      fields[49] as String,
      fields[50] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Warning_Contact obj) {
    writer
      ..writeByte(5)
      ..writeByte(46)
      ..write(obj.vat)
      ..writeByte(47)
      ..write(obj.pitta)
      ..writeByte(48)
      ..write(obj.kapa)
      ..writeByte(49)
      ..write(obj.bmi_final)
      ..writeByte(50)
      ..write(obj.opti_weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WarningContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
