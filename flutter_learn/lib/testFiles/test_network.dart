import 'dart:async';
import 'dart:io';
import 'dart:isolate';

class TestNetwork {
  startTest() {

    getChatMessage1('LiLei'); // 111: Instance of 'Future<String>'
    getChatMessage2('LiBai'); // 3秒后打印  333: 20190808 LiBai

//    testCatchException();
//    testZone();

    testStream();
  }

  getChatMessage1(String userName) {
    print('111: ${queryDatebase(userName)}');
  }

  getChatMessage2(String userName) async {
    var msg1 = await queryDatebase(userName);
    print('222: $msg1');
  }

  // Future 需要 import 'dart:io';（import 'dart:async';）
  // 范型
  Future<String> queryDatebase(String userName) {
    return Future.delayed(Duration(seconds: 3), () => '20190808 $userName');
  }

  testCatchException() {
    // try...on 方式捕获某些类型异常(知道异常类型)
    try {
      testThrowException(0);
    } on IntegerDivisionByZeroException {
      print('捕获除0异常');
    }
    // 不确定甚至不知道异常类型 catch
    try {
      testThrowException(-1);
    } on IntegerDivisionByZeroException {
      print('捕获除0异常');
    } catch (e) {
      print(e);
    } finally {
      print('是否异常都执行finally');
    }
  }

  testThrowException(int exceptionIndex) {
    if (exceptionIndex == 0) {
      throw new IntegerDivisionByZeroException(); // 抛出内置异常
    } else if (exceptionIndex < 0) {
      throw new Exception('Index need more then 0'); // 抛一个自定义异常
    } else {
      print(exceptionIndex);
    }
  }



  //
  testZone() {
    // 未捕获的异常
//    try {
//      Future.error('asynchronous error');
//    } catch(e) {
//      print(e);
//    }

    runZoned((){
      Future.error('asynchronous error');
    }, onError: (Object obj, StackTrace stack){
      // 这里可以调用日志上报函数
      print(obj); // asynchronous error
      print(stack); // null
    });
    
    handleData(result) {
      print('handleData $result'); // handleData 2
    }
    var onData = Zone.current.registerUnaryCallback<dynamic, int>(handleData);
    Zone.current.runUnary(onData, 2);

    // 异步逻辑
    Zone.current.scheduleMicrotask((){
      print('Todo something'); // Todo something
    });
  }
  

  //

  testStream() {
    var streamController = StreamController.broadcast();
    streamController.add("1");
    streamController.stream.listen((i){
      print("广播:"+i);
    });
    streamController.add("2");
    streamController.add("3");
    streamController.close();
  }

}



