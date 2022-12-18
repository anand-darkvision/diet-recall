import 'package:hive/hive.dart';

part 'vatpitta_user_model.g.dart';

@HiveType(typeId: 7)
class VatPitta_Contact{
  @HiveField(40)
  final int vat;
  @HiveField(41)
  final int pitta;
  @HiveField(42)
  final int kapa;
  @HiveField(43)
  final String bmi_final;
  @HiveField(44)
  final String opti_weight;

  VatPitta_Contact(this.vat, this.pitta, this.kapa, this.bmi_final,this.opti_weight);

}