import 'dart:math';

class SatRan {
  var r = Random(DateTime.now().weekday + DateTime.now().weekday + 1);

  saturday(int num) {
    return r.nextInt(num);
  }
}
