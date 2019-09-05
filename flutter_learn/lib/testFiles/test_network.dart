import 'dart:io';

class TestNetwork {
  startTest() {

    print(getChatMessage('LiLei'));
  }

  testIsolate() {

  }

  String getChatMessage(String userName) {
    var msg = queryDatebase(userName);
  }

  // Future 需要 import 'dart:io';
  Future<String> queryDatebase(String userName) {
    return Future.delayed(Duration(seconds: 3), () => '20190808 $userName');
  }
}