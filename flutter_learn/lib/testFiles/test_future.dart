class TestFuture {
  
  startTest() {
    getNumber1().then((aNum) {
      print('a = $aNum');
      return getNumber2(aNum);
    }).then((_) {
      print('_ = $_');
      getResult(_);
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

