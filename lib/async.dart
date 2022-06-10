import 'dart:io';

class Async {
  void asynctest1() {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    print(syncFunc("data1", 3));
    print("data2 start");
    print(syncFunc("data2", 2));
    print("data3 start");
    print(syncFunc("data3", 1));
  }

  String syncFunc(String name, int time) {
    sleep(Duration(seconds: time));
    return name + ":" + DateTime.now().toString();
  }

  void asynctest2() {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    print(asyncFunc1("data1", 3));
    print("data2 start");
    print(asyncFunc1("data2", 2));
    print("data3 start");
    print(asyncFunc1("data3", 1));
  }

  Future<String> asyncFunc1(String name, int time) { //Future<String>は将来的にStringが返されるということ。
    return Future.delayed(Duration(seconds: time), () {
      return name + ":" + DateTime.now().toString();
    });
  }

  void asynctest3() async {
    print("method begin");
    print(DateTime.now().toString());
    print("data1 start");
    Future<String> result1 = asyncFunc2("data1", 3);
    result1.then((result) {
      print(result);
    });
    print("data2 start");
    Future<String> result2 = asyncFunc2("data2", 2);
    result2.then((result) {
      print(result);
    });
    print("data3 start");
    Future<String> result3 = asyncFunc2("data3", 1);
    result3.then((result) {
      print(result);
    });
  }
  // timeの時間分スリープし、その後現在時間を返す関数
  Future<String> asyncFunc2(String name, int time) async {
    return Future.delayed(Duration(seconds: time), () {
      return name + ":" + DateTime.now().toString();
    });
  }
}