import 'package:flutter/cupertino.dart';

class TestOperator {
  startTest() {
    Cat cat1 = new Cat("10");
    String resultNum = cat1 + "20";
    print(resultNum);

    testSwith(Animal.bird);
  }

  testFor() {
    List nameList = ["1", "2", "3"];
    // for
    for (int i = 0; i < nameList.length; i++) {
      print(nameList[i]);
    }

    // forin (.for)
    for (var value in nameList) {
      print(value);
    }

    // forEach
    nameList.forEach((itemValue) => print(itemValue));
  }

  testSwith(Animal animal) {
    String mark1 = "A";
    switch(mark1) {
      case 'A':
        print("A");
        break;
      case 'B':
        print("B");
        break;
    }

    int mark2 = 1;
    switch(mark2) {
      case 1:
        print("1");
        break;
      case 2:
        print("2");
    }

    switch(animal) {
      case Animal.cat:
        print("cat");
        break;
      case Animal.dog:
      case Animal.bird:
        print("dog or bird");
        break;
    }
  }

}

enum Animal {
  cat,
  dog,
  bird
}

class Cat {
  String hadAteFishNum;

  Cat(this.hadAteFishNum);

  String operator +(String eatingFishNum) {
    int resultNum = int.parse(this.hadAteFishNum) + int.parse(eatingFishNum);
    return resultNum.toString();
  }
}
