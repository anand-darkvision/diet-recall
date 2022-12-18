import 'package:hive/hive.dart';

part 'breakfast_user_model.g.dart';

@HiveType(typeId: 0)
class Breakfast_Contact{
  @HiveField(0)
  final String breakFastFood;
  @HiveField(1)
  final int breakFastServings;
  @HiveField(2)
  final String breakFastDrinks;
  @HiveField(3)
  final int breakFastGlass;

  Breakfast_Contact(
      this.breakFastFood,
      this.breakFastServings,
      this.breakFastDrinks,
      this.breakFastGlass,
      );




}