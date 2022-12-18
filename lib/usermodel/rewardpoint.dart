// ignore_for_file: camel_case_types

import 'package:hive/hive.dart';

part 'rewardpoint.g.dart';

@HiveType(typeId: 82)
class rewardpoint {
  @HiveField(90)
  double point;

  rewardpoint(this.point);
}
