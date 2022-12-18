import 'package:hive/hive.dart';

part 'moringsnack_user_model.g.dart';

@HiveType(typeId: 6)
class Morningsnack_Contact{
  @HiveField(24)
  final String morningSnackFood;
  @HiveField(25)
  final int morningSnackServings;
  @HiveField(26)
  final String morningSnackDrinks;
  @HiveField(27)
  final int morningSnackGlass;

  Morningsnack_Contact(this.morningSnackFood, this.morningSnackServings, this.morningSnackDrinks, this.morningSnackGlass);

}