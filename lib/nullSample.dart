import "dart:math" as math;

class NullSample {
  method1() {
    int x = 10; // nullの可能性はない
    int? y = getNullable(); // nullの可能性がある

    if (y != null) {
      x = y; //nullチェックの後のためコンパイルOK
    }
    print("x: " + x.toString() + " y: " + y.toString());
  }

  method2() {
    int x = 20; // nullではない
    int? y = getNullable(); // Nullの可能性がある

    // NonNullableにキャストして代入する。
    // ただし、yにnullが入った状態で行うとエラーになるので注意
    x = y!;
    print("x: " + x.toString() + " y: " + y.toString());
  }

  //ランダムでnullか1を返すメソッド
  getNullable() {
    var rand = new math.Random();
    if (rand.nextInt(2) == 0) {
      return null;
    }
    return 1;
  }
}