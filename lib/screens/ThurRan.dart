import 'dart:math';

class ThurRan {
  var r = Random(DateTime.now().weekday + 3);

  thursday(int num) {
    return r.nextInt(num);
  }
}
