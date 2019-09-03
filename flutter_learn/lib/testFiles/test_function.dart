class TestFunction {
  startTest() {
    // 调用并打印返回值
//    print(fullName1("Li", "Bai")); // Li Bai
//    print(fullName2("Li", "Bai")); // Li Bai
//    print(fullName3("Li", "Bai")); // Li Bai
//
//    print(fullName4("Li", lastName: "Bai")); // Li Bai
//
//    print(fullName5("Li"));// Li null
//
//    print(fullName6());// null Lei
//
//    outerUse("print param", innerUse);
//
//    anonymousUse(); // 测试匿名函数
//    useNowFunction(); // 测试自执行函数
//    testClosure(); // 测试闭包
//    testElementObjectType(); // 测试高级函数(参数不指定类型)
//
//    testNameInit();
//
//    TestStaticFunction.printParam();
//
//    var testGetSet = new TestGetSet();
//    testGetSet.nickName = "LiXiaolong";
//    print("${testGetSet.userName}"); // LiXiaolong
//
//    testIterable();
//    testRunes();

  }

  // 常规书写
  String fullName1(String firstName, String lastName) {
    return "$firstName $lastName";
  }

  // 省略返回类型 箭头函数
  fullName2(String firstName, String lastName) => "$firstName $lastName";

  // 参数还可以是var Object dynamic类型，通过实际赋值类型推导
  fullName3(var firstName, Object lastName) => "$firstName $lastName";

  // 命名参数 {}包装(从尾部参数开始)，调用时也得指定参数名
  fullName4(var firstName, {Object lastName}) => "$firstName $lastName";

  // 可选参数 {}或[]包装都可选(从尾部参数开始) 没有默认值且不赋值则为null
  fullName5(var firstName, [Object lastName]) => "$firstName $lastName";

  // 参数默认值 没有默认值且不赋值则为null
  fullName6([var firstName, Object lastName = "Lei"]) => "$firstName $lastName";

  // 函数作参数(函数一等公民)
  outerUse(String str, void innerPrint(String msg)) => innerPrint(str);
  innerUse(String msg) => print("$msg ${msg.length}");

  // 匿名函数
  anonymousUse() {
    outerUse2(String str, void innerPrint(String msg)) => innerPrint(str);
    var funcParam = (msg) => print("$msg ${msg.length}");
    outerUse2("anonymousUse0", funcParam); // 写成变量然后作参数
    outerUse2("anonymousUse1", (msg) => print("$msg ${msg.length}")); // 直接当参数
    // 不用箭头函数
    outerUse2("anonymousUse2", (msg){
      print("$msg ${msg.length}");
    });
  }

  // 立即执行函数(自执行函数 即定义和调用合为一体)
  // 创建的匿名函数立即执行，外部无法引用它的内部变量，因此执行完很快被释放，这种机制不会污染全局对象。
  useNowFunction() {
    // (function (/* 参数 */) { /* code */ }(/* 参数 */)) // 推荐
    // (function (/* 参数 */) { /* code */ })(/* 参数 */) // 也能
    ((x, y){
      print("${x+y}");
    }(2, 3));

    ((x, y){
      print("${x+y}");
    })(2, 3);

    ((x, y) => print("${x+y}"))(2, 3);
  }

  testClosure() {
    // num 类型是int double的父类， Function是返回类型(可省略，根据返回值推导类型)
    Function addClosure1(int addFrom) {
      return (num addNum) {
        return addFrom + addNum;
      };
    }
    addClosure2(int addFrom) {
      return (num addNum) => addFrom + addNum;
    }

    var addMethod = addClosure1(10);
    print(addMethod(3)); // 13
    print(addMethod(4)); // 14
    print(addClosure2(10)(3)); // 13
  }

  testElementObjectType() {
    printElement(element) => print(element);
    var list = ['LiLei', 'HanMeimei', 'John'];
    list.forEach(printElement);
  }

  testNameInit() {
    TestNameInitFunc testX = new TestNameInitFunc.X(1);
    TestNameInitFunc testY = TestNameInitFunc.Y(2);
    var testXY = TestNameInitFunc.XY(3, 4);
    testX.printParam(); // x:1
    testY.printParam(); // y:2
    testXY.printParam(); // x:3 y:4

    var testX2 = TestNameInitFunc.X2(11);
    var testY2 = TestNameInitFunc.Y2(12);
    var testXY2 = TestNameInitFunc.XY2(13);
    testX2.printParam(); // x:11
    testY2.printParam(); // y:12
    testXY2.printParam(); // x:13 y:14
  }

  testRunes() {
    var clapping = '\u{1f44f}';
    var runes = new Runes('\u2665, \u{1f605}, \u{1f60e}, \u{1f44f}');
    print(clapping); // 👏
    print(runes); // (9829, 44, 32, 128517, 44, 32, 128526, 44, 32, 128079)
    print(new String.fromCharCodes(runes)); // ♥, 😅, 😎
  }

  testIterable() {
    var ite0 = Iterable.empty();
    print(ite0); // ()
    var ite1 = Iterable.generate(5);
    print(ite1); // (0, 1, 2, 3, 4)

    var students = <String>['Seth', 'Kathy', 'Lars'];
    var userInfo = <String, String>{'userName': 'LiLei', 'nickName': 'LaoLi'};

    var persons = new Set<String>();
    students.add("LiLei");
    students.add("HanMei");
    // iterating across list
    for (String userName in persons) {
      print(userName);
    }
  }
}

class TestNameInitFunc {
  int x;
  int y;
  TestNameInitFunc(){} // 不用分号

  TestNameInitFunc.X(int x) {
    this.x = x;
  }
  TestNameInitFunc.Y(int y) {
    this.y = y;
  }
  TestNameInitFunc.XY(int x, int y) {
    this.x = x;
    this.y = y;
  }

  TestNameInitFunc.X2(this.x);
  TestNameInitFunc.Y2(this.y);
  TestNameInitFunc.XY2(this.x, [this.y = 14]);

  printParam() {
    if (x != null && y != null) {
      print("x:${x.toString()} y:${y.toString()}");
    } else if (x != null) {
      print("x:${x.toString()}");
    } else if(y != null) {
      print("y:${y.toString()}");
    }
  }
}

class TestStaticFunction {
  static printParam() {
    print("10086");
  }
}

class Singleton {
  /// 单例对象
  static Singleton _instance;

  /// 内部构造方法，可避免外部暴露构造函数，进行实例化
  Singleton._internal();

  /// 工厂构造方法，这里使用命名构造函数方式进行声明
  factory Singleton.getInstance() => _getInstance();

  /// 获取单例内部方法
  static _getInstance() {
    // 只能有一个实例
    if (_instance == null) {
      _instance = Singleton._internal();
    }
    return _instance;
  }
}

class TestGetSet {
  // 私有
  String _userName;
  String _nickName;

  String get userName {
    return _userName ?? _nickName;
  }
  set userName(String newName) {
    _userName = newName;
  }
  set nickName(String newName) {
    _nickName = newName;
  }
}