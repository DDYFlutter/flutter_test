class TestClass {

  startTest() {

    testAbstractClass();

    testImplements();

    testSomeImplements();

    testMixinWith();

    testGeneric();
  }

  // 抽象类测试
  testAbstractClass() {
    Dog dog = new Dog();
    Cat cat = new Cat();

    dog.eat(); // Dog eat bone
    cat.eat(); // Cat eat fish

    dog.printInfo(); // Animal printInfo
    cat.printInfo(); // Animal printInfo
  }

  // 接口实现测试
  testImplements() {
    StudentDataBase studentDB = new StudentDataBase("LiBai", "10086"); // userName: LiBai passWord: 10086
    studentDB.getUserNameWithPassWord("admin"); // PassWord Error
    studentDB.getUserNameWithPassWord("10086"); // LiBai
    studentDB.resetPassWordOfUserName("LiLei"); // userName error
    studentDB.resetPassWordOfUserName("LiBai"); // reset success
    studentDB.getUserNameWithPassWord("10086"); // PassWord Error
    studentDB.getUserNameWithPassWord("admin"); // LiBai
  }

  // 多接口测试
  testSomeImplements() {
    Pupil pupils = Pupil();
    pupils.sleep(); // Pupil also need sleep
    pupils.study(); // Pupil also need study
  }

  // 混入(mixin)测试
  testMixinWith() {
    AppleTree appleTree = new AppleTree();
    appleTree.info(); // Plant don't move
    appleTree.root(); // Tree has the root
    appleTree.leaf(); // AppleTree has leaves
  }

  testGeneric() {
    Cache cacheTest = new Cache<String>();
    cacheTest.set("name", "LiXiaolong");
    print("${cacheTest.get("name")}");
  }
}

// 抽象类与继承
abstract class Animal {
  eat(); // 未实现，抽象方法，子类必须实现
  printInfo() { // 已经实现，子类不必须实现
    print("Animal printInfo");
  }
}

class Cat extends Animal {
  @override
  eat() {
    print("Cat eat fish");
  }
}

class Dog extends Animal {

  @override
  eat() {
    print('Dog eat bone');
  }
}

// 抽象类与接口
abstract class PersonDataBase {
  String userName;
  String passWord;

  getUserNameWithPassWord(String passWord);
  resetPassWordOfUserName(String userName);
}

class StudentDataBase implements PersonDataBase {
  @override
  String passWord;

  @override
  String userName;

  @override
  getUserNameWithPassWord(String newPassWord) {
    if (newPassWord == passWord) {
      print("${userName}");
    } else {
      print("PassWord Error");
    }
  }

  @override
  resetPassWordOfUserName(String userName) {
    if (userName == this.userName) {
      this.passWord = "admin";
      print("reset success");
    } else {
      print("userName error");
    }
  }

  StudentDataBase(this.userName, [this.passWord = "admin"]) {
    print("userName: ${this.userName} passWord: ${this.passWord}");
  }
}

// 多接口
abstract class Person {
  sleep();
}

abstract class Student {
  study();
}

class Pupil implements Person, Student {
  @override
  sleep() {
    print("Pupil also need sleep");
  }

  @override
  study() {
    print("Pupil also need study");
  }
}

// 混入 mixin
class Plant {
  info() {
    print("Plant don't move");
  }
}

abstract class Tree {
  leaf();
  root() {
    print("Tree has the root");
  }
}

class AppleTree extends Object with Plant, Tree {
  @override
  leaf() {
    print("AppleTree has leaves");
  }
}

// 范型接口
abstract class Storage<T> {
  Map mapIn = new Map();
  void set(String key, T value);
  T get(String key);
}

class Cache<T> implements Storage<T> {
  @override
  Map mapIn = new Map();

  @override
  T get(String key) {
    return mapIn[key];
  }

  @override
  void set(String key, T value) {
    mapIn[key] = value;
    print("success");
  }
}
