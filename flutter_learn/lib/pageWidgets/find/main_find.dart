import 'package:flutter/material.dart';

class FindPage extends StatefulWidget {

  String title;

  FindPage({Key outerKey, this.title}) : super(key: outerKey);

  @override
  State<StatefulWidget> createState() {
    return _FindPageTabBarState();
  }
}

class _FindPageTabBarState extends State<FindPage> with SingleTickerProviderStateMixin {

  TabController _tabController; // tabController变量
  final List<Tab> _topTabs = [Tab(text: '我000', ), Tab(text: '是111',), Tab(text: '谁222',)];
  List<Widget> _tabContents = [
    Center(child: SelectableText('这是一个能选择的文本\nThis is a SelectableText', style: TextStyle(fontSize: 25.0),),),
    Center(child: SelectableText('这是一个能选择的文本\nThis is a SelectableText', style: TextStyle(fontSize: 25.0),),),
    Center(child: SelectableText('这是一个能选择的文本\nThis is a SelectableText', style: TextStyle(fontSize: 25.0),),),];
  // 销毁函数
  // @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void initState() {
    super.initState();
    _tabController = TabController(length: _topTabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title, style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.teal.shade400,
        bottom: TabBar(
          tabs: _topTabs,
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
          labelColor: Colors.white,
          labelStyle: TextStyle(fontSize: 16.0),
          unselectedLabelColor: Colors.red,
          unselectedLabelStyle: TextStyle(fontSize: 16.0),
          controller: _tabController, // TabBar与自定义TabController绑定
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: _tabContents,
      ),
    );
  }
}