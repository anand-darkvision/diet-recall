import 'package:hive/hive.dart';

part 'lunch_user_model.g.dart';

@HiveType(typeId: 5)
class lunch_Contact{
  @HiveField(20)
  final String lunchFood;
  @HiveField(21)
  final int lunchServings;
  @HiveField(22)
  final String lunchDrinks;
  @HiveField(23)
  final int lunchGlass;

  lunch_Contact(this.lunchFood, this.lunchServings, this.lunchDrinks, this.lunchGlass);
}