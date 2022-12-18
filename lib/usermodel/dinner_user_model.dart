import 'package:hive/hive.dart';

part 'dinner_user_model.g.dart';

@HiveType(typeId: 2)
class Dinner_Contact {
  @HiveField(8)
  final String dinnerFood;
  @HiveField(9)
  final int dinnerServings;
  @HiveField(10)
  final String dinnerDrinks;
  @HiveField(11)
  final int dinnerGlass;

  Dinner_Contact(this.dinnerFood, this.dinnerServings, this.dinnerDrinks,
      this.dinnerGlass);
}
