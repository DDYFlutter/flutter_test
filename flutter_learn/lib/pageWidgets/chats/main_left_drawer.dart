import 'package:flutter/material.dart';

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
              new Text("box child 2")
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
