import 'dart:math';

class WedRan {
  var r = Random(DateTime.now().weekday + 2);

  wednesday(int num) {
    return r.nextInt(num);
  }
}
