// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vatpitta_user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VatPittaContactAdapter extends TypeAdapter<VatPitta_Contact> {
  @override
  final int typeId = 7;

  @override
  VatPitta_Contact read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VatPitta_Contact(
      fields[40] as int,
      fields[41] as int,
      fields[42] as int,
      fields[43] as String,
      fields[44] as String,
    );
  }

  @override
  void write(BinaryWriter writer, VatPitta_Contact obj) {
    writer
      ..writeByte(5)
      ..writeByte(40)
      ..write(obj.vat)
      ..writeByte(41)
      ..write(obj.pitta)
      ..writeByte(42)
      ..write(obj.kapa)
      ..writeByte(43)
      ..write(obj.bmi_final)
      ..writeByte(44)
      ..write(obj.opti_weight);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VatPittaContactAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
