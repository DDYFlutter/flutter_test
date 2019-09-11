import 'package:flutter/material.dart';

class ChatsPage extends StatefulWidget {

  String title;

  ChatsPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _ChatsPageState();
  }

}

class _ChatsPageState extends State<ChatsPage> {
  // 下拉菜单
  _buildPopupMenu(IconData icon, String title, String menuID) {
    return new PopupMenuItem<String>(
      value: menuID,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[Icon(icon, color: Colors.blue,), Text(title),],
      ),
    );
  }

  _popupMenuList() {
    var items = new List<PopupMenuItem<String>>();
    items.add(_buildPopupMenu(Icons.message, '发起聊天', '1'));
    items.add(_buildPopupMenu(Icons.group_add, '添加朋友', '2'));
    items.add(_buildPopupMenu(Icons.scanner, '扫一扫', '3'));
    return items;
  }

  _buildAppBar() {
    return AppBar(
      title: Text(widget.title),
      leading: Icon(Icons.home),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add_alert),
            tooltip: 'Hello Flutter Alert',
            onPressed: (){}),
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) => _popupMenuList(),
          onSelected: (String selectIndex){
            switch(selectIndex) {
              case '1': print('1'); break;
              case '2': print('2'); break;
              case '3': print('3'); break;
            }
          },
        ),
      ],
    );
  }

  _buildBody() {
    return Center(
      child: Container(
        child: Transform(transform: Matrix4.rotationZ(1.0), child: Text('Hello Flutter Body', style: TextStyle(color: Colors.white, fontSize: 25.0),),),
        alignment: Alignment.topLeft,
        width: 250,
        height: 250,
        // 设置边框
        decoration: BoxDecoration(
          color: Colors.blue,
          border: Border.all(color: Colors.lightBlue, width: 2.0),
          gradient: LinearGradient(
              colors: [Colors.red, const Color(0xFF0000FF)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight),
        ),
        // 内边距
        padding: EdgeInsets.all(30.0),
        margin: EdgeInsets.all(50.0),
        // 旋转
        transform: Matrix4.rotationZ(-0.3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

}
