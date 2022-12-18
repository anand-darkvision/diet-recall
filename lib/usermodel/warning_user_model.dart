import 'package:hive/hive.dart';

part 'warning_user_model.g.dart';

@HiveType(typeId: 9)
class Warning_Contact{
  @HiveField(46)
  final int vat;
  @HiveField(47)
  final int pitta;
  @HiveField(48)
  final int kapa;
  @HiveField(49)
  final String bmi_final;
  @HiveField(50)
  final String opti_weight;

  Warning_Contact(this.vat, this.pitta, this.kapa, this.bmi_final,this.opti_weight);

}