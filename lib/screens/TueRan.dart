import 'dart:math';

class TueRan {
  var r = Random(DateTime.now().weekday + 1);

  tuesday(int num) {
    return r.nextInt(num);
  }
}
