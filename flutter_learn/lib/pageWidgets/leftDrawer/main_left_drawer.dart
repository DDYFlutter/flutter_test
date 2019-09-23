import 'package:flutter/material.dart';

class LeftDrawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LeftDrawePageState();
}

class _LeftDrawePageState extends State<LeftDrawerPage> {

  _buildHeader() {

    _buildDrawerHeader1() {

    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  _buildDrawerHeader() {
    return UserAccountsDrawerHeader(
      accountName: Text('RainDou', style: TextStyle(color: Colors.white, fontSize: 20,),),
      accountEmail: Text('634778311@qq.com', style: TextStyle(color: Colors.white, fontSize: 16,),),
      currentAccountPicture: CircleAvatar(
        backgroundImage: AssetImage("image/RainDou.gif"),
        backgroundColor: Colors.blueGrey.shade200,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.deepPurple, Colors.blue.shade300, Colors.indigoAccent],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
    );
  }

  _buildListView() {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return ListTile(leading: Icon(Icons.group_add, color: Colors.blue,), title: Text('新建群聊', style: TextStyle(color: Colors.blue),),);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 100,
      color: Colors.white,
      child: ListView(
        //ListView padding 不为空的时候，Drawer顶部的状态栏就不会有灰色背景
        padding: EdgeInsets.zero,
        children: <Widget>[
          _buildDrawerHeader(),

          ///功能列表
          ListTile(
            leading: new Icon(Icons.favorite_border),
            title: Text("收藏"),
            trailing: new Icon(Icons.chevron_right),
            onTap: () {
              print('收藏');
            },
          ),
          ListTile(
            leading: new Icon(Icons.info_outline),
            title: Text("关于"),
            trailing: new Icon(Icons.chevron_right),
            onTap: () {
              print('关于');
            },
          ),
          ListTile(
            leading: new Icon(Icons.share),
            title: Text("分享"),
            trailing: new Icon(Icons.chevron_right),
            onTap: () {
              print('分享');
            },
          ),

          Divider(),

          ListTile(
            leading: new Icon(Icons.phonelink_erase),
            title: Text("退出"),
            trailing: new Icon(Icons.chevron_right),
            onTap: () {
              print('退出');
              //关闭drawer
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }

}

class MainLeftDrawer {
  static Widget leftDrawer() {
    return new ListView(
        padding: const EdgeInsets.only(),
        children: <Widget>[
          _drawerHeader(),
          new ClipRect(
            child: new ListTile(
              leading: new CircleAvatar(child: new Text("A")),
              title: new Text('Drawer item A'),
              onTap: () => {},
            ),
          ),
          new ListTile(
            leading: new CircleAvatar(child: new Text("B")),
            title: new Text('Drawer item B'),
            subtitle: new Text("Drawer item B subtitle"),
            onTap: () => {},
          ),
          new AboutListTile(
            icon: new CircleAvatar(child: new Text("Ab")),
            child: new Text("About"),
            applicationName: "Test",
            applicationVersion: "1.0",
            applicationIcon: new Image.asset(
              "image/RainDou.gif",
              width: 64.0,
              height: 64.0,
            ),
            applicationLegalese: "applicationLegalese",
            aboutBoxChildren: <Widget>[
              new Text("BoxChildren"),
              new Text("box child 2"),
            ],
          ),
        ]);
  }

  static Widget _drawerHeader() {
    return new UserAccountsDrawerHeader(
      decoration: BoxDecoration(
        color: Colors.blue,
        gradient: LinearGradient(
          colors: [Colors.teal, const Color(0xFF0000FF), Colors.red,],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      margin: EdgeInsets.zero,
      accountName: new Text(
        "DDY",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      accountEmail: new Text(
        "634778311@.com",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      currentAccountPicture: new CircleAvatar(
        backgroundImage: new AssetImage("image/RainDou.gif"),
      ),
      onDetailsPressed: () {
        print('onDetailsPressed 666');
      },
      otherAccountsPictures: <Widget>[
        new CircleAvatar(
          backgroundImage: new AssetImage("image/RainDou.gif"),
        ),
      ],
    );
  }
}
