import 'package:hive/hive.dart';

part 'evening_user_model.g.dart';

@HiveType(typeId: 3)
class evening_Contact{
  @HiveField(12)
  final String eveningFood;
  @HiveField(13)
  final int eveningServings;
  @HiveField(14)
  final String eveningDrinks;
  @HiveField(15)
  final int eveningGlass;

  evening_Contact(this.eveningFood, this.eveningServings, this.eveningDrinks, this.eveningGlass);
}