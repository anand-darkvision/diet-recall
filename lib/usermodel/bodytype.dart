// ignore_for_file: camel_case_types

import 'package:hive/hive.dart';

part 'bodytype.g.dart';

@HiveType(typeId: 15)
class bodytype_Contact {
  @HiveField(60)
  final List<double> bodyt;

  bodytype_Contact(this.bodyt);
}
