import 'dart:math';

class MonRan {
  var r = Random(DateTime.now().weekday);

  monday(int num) {
    return r.nextInt(num);
  }
}
