import 'dart:math';

class FriRan {
  var r = Random(DateTime.now().weekday + DateTime.now().weekday);

  friday(int num) {
    return r.nextInt(num);
  }
}
