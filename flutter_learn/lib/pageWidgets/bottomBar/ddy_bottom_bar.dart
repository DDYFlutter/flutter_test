import 'package:flutter/material.dart';
import 'dart:io';

import 'package:flutter_learn/pageWidgets/chats/main_chats.dart';
import 'package:flutter_learn/pageWidgets/contacts/main_contacts.dart';
import 'package:flutter_learn/pageWidgets/find/main_find.dart';
import 'package:flutter_learn/pageWidgets/mine/main_mine.dart';

class DDYBottomBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _tabbarState();
}

class _tabbarState extends State<DDYBottomBar> {

  /// 默认选中
  int _selectedIndex = 0;
  /// 按钮文字
  final _itemTextList = ['聊天', '通讯录', '发现', '我的'];
  /// 按钮图标
  final _itemIconList = ['chats', 'contacts', 'find', 'mine'];
  /// 主体页面
  final _bodyPageList = [HomePage(title: "聊天"), HomePage(title: "通讯录"), HomePage(title: "发现"), HomePage(title: "我的")];

  /// 构建按钮
  BottomNavigationBarItem _buildBottomBarItem(int index) {

    var isSelect = index == _selectedIndex;
    var itemText = _itemIconList[index];
    var itemIcon = 'image/main_tab_' + '${_itemIconList[index]}' + '${isSelect ? '_pre.png' : '_nor.png'}';
    var itemSize = isSelect ? 37.0 : 34.0;
    var itemColor = isSelect ? Colors.cyan : Colors.grey;

    return BottomNavigationBarItem(
        icon: new Image.asset(itemIcon, width: itemSize, height: itemSize,),
        title: Text(itemText, style: TextStyle(color: itemColor),)
    );
  }
  /// 构建底部导航条
  Widget _buildBottomBar() {
    return BottomNavigationBar(
      items: [_buildBottomBarItem(0), _buildBottomBarItem(1), _buildBottomBarItem(2), _buildBottomBarItem(3)],
      type: BottomNavigationBarType.fixed,
      onTap: _onTapToSelectItem,
      currentIndex: _selectedIndex,
    );
  }

  /// 构建主体页面
  Widget _buildBody() {
    return _bodyPageList[_selectedIndex];
  }

  /// 点击事件回调
  _onTapToSelectItem(int toIndex) {
    setState(() => _selectedIndex = toIndex);
  }

  @override
  Widget build(BuildContext context) {

    var ScreenSize = MediaQuery.of(context).size;
    var StatusHeight = MediaQuery.of(context).padding.top;
    print('$ScreenSize $StatusHeight'); // Size(375.0, 667.0) 20.0

   if ( Platform.isIOS) {
     print("iOS Platform");
   } else {
     print("Other Platform");
   }

    return Scaffold(body: _buildBody(), bottomNavigationBar: _buildBottomBar(),);
  }

  testInfo() {
    // <scheme>://<user>:<password>@<host>:<port>/<path>;<params>?<query>#<frag>
    // https://<host>:<端口>/<路径>?<查询>#<片段>
    var uri1 = 'https://github.com/starainDou?tab=repositories';
    var encodeFullURI = Uri.encodeFull(uri1);
    var encodeComponentURI = Uri.encodeComponent(uri1);

    var uri2 = Uri(scheme: 'https', host: 'google.com', path: '/News/today', fragment: 'frag');
    var uri3 = Uri.parse('htps://google.com/News/tody#frag');

    print('${Uri.decodeFull(encodeFullURI)}'); //  https://github.com/starainDou?tab=repositories
    print('${Uri.decodeComponent(encodeComponentURI)}'); //  https://github.com/starainDou?tab=repositories
    print('${uri2}'); //  https://google.com/News/today#frag
    print('${uri3}'); //  htps://google.com/News/tody#frag
  }

  testDate() {
    var date1 = DateTime.now(); // 当前时间
    var date2 = DateTime.now().millisecondsSinceEpoch; // 时间戳 1970年1月1日UTC以来的毫秒数
    var date3 = DateTime(2019,3,31,10,59); //组装时间
    var date4 = DateTime.utc(2022); //UTC
    var date5 = DateTime.fromMillisecondsSinceEpoch(946684800000, isUtc: true); // 转化时间戳为UTC时间(2000-01-01)
    var date6 = date5.add(Duration(days: 366)); // 加366天(闰年)
    
    print(date1); // 2019-09-04 14:19:01.654525
    print(date2); // 1567577941654
    print(date3); // 2019-03-31 10:59:00.000
    print(date4); // 2022-01-01 00:00:00.000Z
    print(date5); // 2000-01-01 00:00:00.000Z
    print(date6); // 2001-01-01 00:00:00.000Z
  }
}

/// 工厂构造函数
class DDYLogger {
  final String logKey;
  static final _cache = new Map<String, DDYLogger>();

  factory DDYLogger(String logKey) {
    if (_cache.containsKey(logKey)) {
      return _cache[logKey];
    } else {
      final logger = DDYLogger._init(logKey);
      _cache[logKey] = logger;
      return logger;
    }
  }

  DDYLogger._init(this.logKey);
}

// 子类构造方法
class Animal {
  String name;

  Animal.createInstance() {
    print('Animal Class ${name}');
    name = "+++";
    print('Animal Class ${name}');
  }
}

class Dog extends Animal {
  String name;

  Dog.createInstance(): name = '!!!', super.createInstance() {
    print('Dog Class ${name}');
    name = "???";
    print('Dog Class ${name}');
  }
}

class Student {
  final String name;
  final int age;

  const Student(this.name, this.age);
}

class TestConstClassMethod {
  startTest() {

    var student1 = const Student('LiLei', 18);
    var student2 = const Student('LiLei', 18);
    var student3 = Student('LiLei', 18);
    // identical(obj1, obj2) 比较是否一个对象
    print(identical(student1, student2)); // true
    print(identical(student1, student3)); // false
    print(student1 == student2); // true
    print(student1 == student3); // false

    const studentClass1 = [Student('LiLei', 18), Student('LiLei', 18)];
    print('${studentClass1[0] == studentClass1[1]}'); // true
    print('${identical(studentClass1[0], studentClass1[1])}'); // ture
    // 等于了 const studentClass = const [const Student('LiLei', 18), const Student('LiLei', 18)];

    var studentClass2 = const [Student('LiLei', 18), Student('LiLei', 18)];
    print('${studentClass2[0] == studentClass2[1]}'); // true
    print('${identical(studentClass2[0], studentClass2[1])}'); // ture

    print(studentClass1 == studentClass2); // ture
    print(identical(studentClass1, studentClass2)); // ture
  }
}
