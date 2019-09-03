import 'package:flutter/material.dart';

import 'package:flutter_app/testFiles/test_class.dart';
import 'package:flutter_app/testFiles/test_type.dart';
import 'package:flutter_app/testFiles/test_function.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  State<StatefulWidget> createState() => _homePageState();
}

class _homePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Color.fromARGB(255, 200, 0, 255),
        elevation: 2,
      ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'You have pushed the button this many times:',
              ),
            ],
          ),
        )
    );
  }
}

class Item {
  String title;
  String detail;

  Item(this.title, this.detail);
}
/**
    List _listData = new List<Item>();

    _listData.add(Item("测试数据类型", "num, String, bool, List, Map"));
 * */

/*
  var testType = new TestType().startTest();
  var testFunc = new TestFunction().startTest();
  var testClass = new TestClass().startTest();
* */