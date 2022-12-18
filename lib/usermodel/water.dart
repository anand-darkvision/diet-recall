import 'package:hive/hive.dart';

part 'water.g.dart';

@HiveType(typeId: 81)
class Water {
  @HiveField(81)
  int water;

  Water(this.water);
}
