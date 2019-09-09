import 'dart:io';

class TestFuture {
  
  startTest() {
    _TestFutureFunction().testThen();
    _TestFutureFunction().testWhenComplete();
    _TestFutureFunction().testAwait();
    _TestFutureFunction().testWait();
  }
}

class _TestFutureFunction {

  // then()回调中带参数，此参数为Future对象中包含的值
  testThen() {
    getNumber1().then((aNum) {
      print('a = $aNum');
      return getNumber2(aNum);
    }).then((_) {
      print('_ = $_');
      getResult(_);
    });
  }

  // whenComplete()中不带参数,只指定了顺序，此方法抛出异常后使用相当于finally
  testWhenComplete() {
    getNumber1().whenComplete((){
      getNumber2(9).whenComplete((){
        getResult(7).then((_){
          print('TestWhenComplete');
        });
      });
    });
  }

  // 使用async await
  testAwait() async {
    var number1 = await getNumber1();
    var number2 = await getNumber2(number1);
    print(await getResult(number2));
  }

  // wait()方法
  testWait() {
    Future.wait([getNumber1(), getNumber2(2), getResult(4)]).then((List result){
      result.forEach((num) => print(num));
    });
  }

  Future<int> getNumber1() async {
    await print('getNumber1 10086');
    return 10086;
  }

  Future getNumber2(int num) async {
    await print('getNumber2 ${num + 2}');
    return num + 2;
  }

  Future getResult(int num) async {
    await print('getRusult');
  }
}
