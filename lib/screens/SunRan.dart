import 'dart:math';

class SunRan {
  var r = Random(DateTime.now().weekday + DateTime.now().weekday + 2);

  sunday(int num) {
    return r.nextInt(num);
  }
}
