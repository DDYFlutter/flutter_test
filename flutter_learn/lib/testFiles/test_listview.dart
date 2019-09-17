import 'dart:math';

import 'package:flutter/material.dart';

class TestListView extends StatefulWidget {

  TestListView({Key, key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestListViewState6();
}

// 适用于少量有限
class _TestListViewState1 extends State<TestListView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试ListView()'),),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(title: Text('item1'), trailing: Icon(Icons.chevron_right, color: Colors.blue.shade600,),),
            ListTile(title: Text('item2'), leading: Icon(Icons.adb),),
            ListTile(title: Text('item3'),),
            ListTile(title: Text('item4'), subtitle: Text('subTitle'),),
          ],
        ),
      ),
    );
  }
}

// 显示分割线
class _TestListViewState2 extends State<TestListView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试ListView()'),),
      body: Center(
        child: ListView(
          children: ListTile.divideTiles(
            context: context,
            tiles: [
              ListTile(title: Text('item1'), trailing: Icon(Icons.chevron_right, color: Colors.blue.shade600,),),
              ListTile(title: Text('item2'), leading: Icon(Icons.adb),),
              ListTile(title: Text('item3'),),
              ListTile(title: Text('item4'), subtitle: Text('subTitle'),),
            ],
          ).toList(),
        ),
      ),
    );
  }
}

// 测试ListView.builder()
class _TestListViewState3 extends State<TestListView> {

  final cities = ['BeiJing', 'ShangHai', 'ChongQing', 'HeFei', 'HanDan', 'JiLin', 'BaoDing', 'ShenYang', 'ZhengZhou', 'LaSa',
    'ChangChun', 'GuiYange', 'KunMing', 'TaiYuan', 'ChengDu', 'JiNan', 'QingDao', 'MoHe', 'TengChong', 'ShenZhen', 'TianJin',
  'SuZhou', 'CangZhou', 'MianYang'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试 ListView.builder()'),),
      body: ListView.builder(
        itemCount: cities.length, // 必须给定数量，否则变成无限造成越界
          itemBuilder: (context, index) {
            return ListTile(title: Text(cities[index]),);
      }),
    );
  }
}

// 测试ListView.separated()
class _TestListViewState4 extends State<TestListView> {

  List cities = ['BeiJing', 'ShangHai', 'ChongQing', 'HeFei', 'HanDan', 'JiLin', 'BaoDing', 'ShenYang', 'ZhengZhou', 'LaSa',
    'ChangChun', 'GuiYange', 'KunMing', 'TaiYuan', 'ChengDu', 'JiNan', 'QingDao', 'MoHe', 'TengChong', 'ShenZhen', 'TianJin',
    'SuZhou', 'CangZhou', 'MianYang'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试 ListView.builder()'),),
      body: ListView.separated(
        itemCount: cities.length, // 必须给定数量，否则变成无限造成越界
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(cities[index]),
            onTap: () {
              print('onTap $index');
            },
            onLongPress: () {
              print('onLongPress $index and add new item \'888888\'');
              setState(() { // setState(){} 后重绘
                cities.insert(0, '888888');
              });
            },
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

// 水平布局
class _TestListViewState5 extends State<TestListView> {

  final cities = ['BeiJing', 'ShangHai', 'ChongQing', 'HeFei', 'HanDan', 'JiLin', 'BaoDing', 'ShenYang', 'ZhengZhou', 'LaSa',
    'ChangChun', 'GuiYange', 'KunMing', 'TaiYuan', 'ChengDu', 'JiNan', 'QingDao', 'MoHe', 'TengChong', 'ShenZhen', 'TianJin',
    'SuZhou', 'CangZhou', 'MianYang'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试 ListView.builder()'),),
      body: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cities.length, // 必须给定数量，否则变成无限造成越界
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            color: Colors.grey.shade100,
            child: Text(cities[index]),
          );
        },
        separatorBuilder: (context, index) => Divider(),
      ),
    );
  }
}

class _TestListViewState6 extends State<TestListView> {

  final cities = ['BeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJingBeiJing', 'ShangHai', 'ChongQing', 'HeFei', 'HanDan', 'JiLin', 'BaoDing', 'ShenYang', 'ZhengZhou', 'LaSa',
    'ChangChun', 'GuiYange', 'KunMing', 'TaiYuan', 'ChengDu', 'JiNan', 'QingDao', 'MoHe', 'TengChong', 'ShenZhen', 'TianJin',
    'SuZhou', 'CangZhou', 'MianYang'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试 ListView.builder()'),),
      body: ListView.custom(
        childrenDelegate: SliverChildBuilderDelegate((context, index) {
          return Container(
            alignment: Alignment.center,
            color: Colors.deepPurple[100*Random().nextInt(2)+100],
            child: Text(cities[index], style: TextStyle(color: Colors.red), maxLines: 7,),
            constraints: BoxConstraints(minHeight: 50, maxHeight: 300),
          );
        },
          childCount: cities.length,
        ),
      ),
    );
  }
}
