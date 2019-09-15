import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {

  String title;

  MinePage({Key outerKey, this.title}) : super(key: outerKey);

  final List<Tab> _topTabs = [Tab(text: '我000', ), Tab(text: '是111',), Tab(text: '谁222',)];

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return DefaultTabController( // 默认的TabController
      length: _topTabs.length,
      child: Scaffold(
        appBar: AppBar(
          title: Text(title, style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.deepPurple,
          bottom: TabBar(
            tabs: _topTabs, // 绑定标签数组
            indicatorColor: Colors.white,// 指示器颜色
            isScrollable: true,
            labelColor: Colors.white,
            labelStyle: TextStyle(fontSize: 16.0),
            unselectedLabelColor: Colors.red.shade400,
            unselectedLabelStyle: TextStyle(fontSize: 16.0),
          ),
        ),
        body: TabBarView(
          children: _topTabs.map((Tab item){
            return new Center(child: SelectableText(item.text, style: TextStyle(fontSize: 20.0),),);
          }).toList(),
        ),
      ),
    );
  }
}



