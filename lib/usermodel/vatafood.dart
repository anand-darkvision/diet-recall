import 'package:hive/hive.dart';

part 'vatafood.g.dart';

@HiveType(typeId: 80)
class VataFoodcContact {
  @HiveField(80)
  String vatafoodName;
  @HiveField(81)
  String vataFoodTime;

  VataFoodcContact(this.vatafoodName, this.vataFoodTime);
}
