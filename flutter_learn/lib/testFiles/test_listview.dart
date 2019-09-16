import 'package:flutter/material.dart';

class TestListView extends StatefulWidget {

  TestListView({Key, key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TestListViewState();
}

class _TestListViewState extends State<TestListView> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('测试ListView'),),
      body: Center(
        child: ListView(
          children: <Widget>[
            ListTile(title: Text('item1'), trailing: Icon(Icons.chevron_right, color: Colors.blue.shade600,),),
            ListTile(title: Text('item2'),),
            ListTile(title: Text('item3'),),
            ListTile(title: Text('item4'), subtitle: Text('subTitle'),),
          ],
        ),
      ),
    );
  }
}