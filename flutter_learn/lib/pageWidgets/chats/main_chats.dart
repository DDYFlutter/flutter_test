import 'package:flutter/material.dart';
import 'package:flutter_learn/pageWidgets/qrcode/qrcode_generator.dart';
import 'dart:ui';
import 'package:vector_math/vector_math_64.dart' as ddyVector;

import 'package:flutter_learn/pageWidgets/qrcode/qrcode_scanner.dart';
import 'dart:math';
import 'package:flutter_learn/testFiles/test_listview.dart';

class ChatsPage extends StatefulWidget {
  String title;

  ChatsPage({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatsPageState();
}

class _ChatsPageState extends State<ChatsPage> {

  final _ListItems = ['testListView', 'TestGridView'];

  _buildOpenDrawerButton() {
    return Builder(
      builder: (context){
        return IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    );
  }

  _buildShowAlertButton() {
    return IconButton(
      icon: Icon(Icons.add_alert),
      tooltip: '点我代表弹出提示--该按钮点击弹出',
      onPressed: (){

      },
    );
  }

  _buildPopupMenuItem(IconData icon, String title, int menuID) {
    return PopupMenuItem(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Icon(icon, color: Colors.blue,),
          Padding(padding: EdgeInsets.all(5.0)),
          Text(title),
        ],
      ),
      value: menuID,
    );
  }

  _popupMenuList() {
    var items = new List<PopupMenuItem<int>>();
    items.add(_buildPopupMenuItem(Icons.message, '发起聊天', 0));
    items.add(_buildPopupMenuItem(Icons.group_add, '添加朋友', 1));
    items.add(_buildPopupMenuItem(Icons.crop_free, '扫一扫', 2));
    items.add(_buildPopupMenuItem(Icons.list, 'ListView', 3));
    return items;
  }

  _buildPopupMenuButton() {
    return PopupMenuButton<int>(
      itemBuilder: (_) => _popupMenuList(),
      onSelected: (index) {
        switch(index) {
          case 1: print('1'); break;
          case 2: print('2'); break;
          case 3: print('3'); break;
          case 4: print('4'); break;
        }
      },
    );
  }

  _buildAppBar() {
    return AppBar(
      title: Text(widget.title ?? "首页"),
      centerTitle: true,
      leading: _buildOpenDrawerButton(),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        _buildShowAlertButton(),
        _buildPopupMenuButton(),
      ],
    );
  }

  _buildListView() {
    return ListView.builder(
      itemCount: _ListItems.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(_ListItems[index]),
          onTap: (){
            switch(index) {
              case 0: print('0'); break;
              case 1: print('1'); break;
              default: print('3'); break;
            }
          },
        );
      },
    );
  }

  _buildLeftDrawer() {
    return Drawer(
      semanticLabel: '我',
      child: Center(
        child: Column(
          children: <Widget>[
            Text('1'),
            Text('2'),
            Text('3'),
            Text('4'),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildListView(),
      //drawer: _buildLeftDrawer(),
    );
  }

}














class _ChatsPageState1 extends State<ChatsPage> {
  // 下拉菜单
  _buildPopupMenu(IconData icon, String title, String menuID) {
    return new PopupMenuItem<String>(
      value: menuID,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Icon(
            icon,
            color: Colors.blue,
          ),
          Padding(padding: EdgeInsets.all(5.0)),
          Text(title),
        ],
        crossAxisAlignment: CrossAxisAlignment.end,
      ),
    );
  }

  _popupMenuList() {
    var items = new List<PopupMenuItem<String>>();
    items.add(_buildPopupMenu(Icons.message, '发起聊天', '1'));
    items.add(_buildPopupMenu(Icons.group_add, '添加朋友', '2'));
    items.add(_buildPopupMenu(Icons.crop_free, '扫一扫', '3'));
    items.add(_buildPopupMenu(Icons.list, 'ListView', '4'));
    return items;
  }

  _buildAppBar() {
    return AppBar(
      title: Text(widget.title ?? "首页"),
      centerTitle: true,
      leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
          );
        },
      ),
      backgroundColor: Colors.blue,
      actions: <Widget>[
        IconButton(
            icon: Icon(Icons.add_alert),
            tooltip: 'Hello Flutter Alert',
            onPressed: () {
              pushQRCodeGenerator();
            }),
        PopupMenuButton<String>(
          itemBuilder: (BuildContext context) => _popupMenuList(),
          onSelected: (String selectIndex) {
            switch (selectIndex) {
              case '1':
                pushToQRCodeScanner();
                break;
              case '2':
                pushQRCodeScannerAndCallbackData3();
                break;
              case '3':
                pushQRCodeScannerWithCustomAnimation2();
                break;
              case '4':
                pushListView();
                break;
            }
          },
        ),
      ],
    );
  }

  _buildBody() {
    return Center(
      child: Container(
        child: Transform(
          transform: Matrix4.rotationZ(1.0),
          child: Text(
            'Hello Flutter Body',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
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
        transform: Matrix4.compose(
            ddyVector.Vector3(-10.0, -10.0, -10.0),
            ddyVector.Quaternion.random(Random(10)),
            ddyVector.Vector3(0.7, 1.2, 0.9)),
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

  pushQRCodeGenerator() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => QRCodeGenerator((String value) {
          print('QRCodeGenerator callback $value');
        }),
      ),
    );
  }

  pushToQRCodeScanner() {
//  Navigator.push(context, MaterialPageRoute(builder: (context) => QRCodeScanner()));
//  Navigator.of(context).push(MaterialPageRoute(builder: (_) => QRCodeScanner()));
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => QRCodeScanner()));

//    Navigator.pushNamed(context, '/home/qrcode');
//    Navigator.pushNamed(context, '/home_qrcode');
//    Navigator.pushNamed(context, '+home_qrcode');
//    Navigator.of(context).pushNamed('+home_qrcode');
  }

  pushQRCodeScannerAndCallbackData1() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => QRCodeScanner()))
        .then((value) {
      print('1 $value');
    });
  }

  pushQRCodeScannerAndCallbackData2() {
    Future callbackFuture = Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => QRCodeScanner()));
    callbackFuture.then((value) {
      print('2 $value');
    });
  }

  pushQRCodeScannerAndCallbackData3() async {
    // 如果知道类型
    String callbackString = await Navigator.of(context)
        .push<String>(MaterialPageRoute(builder: (context) {
      return QRCodeScanner(title: 'I am 3');
    }));
    if (callbackString != null) {
      print('3 ${callbackString}');
    }
  }

  pushQRCodeScannerWithCustomAnimation1() {
    Navigator.push(
      context,
      PageRouteBuilder(pageBuilder: (BuildContext context,
          Animation<double> animation, Animation<double> secondaryAnimation) {
        return QRCodeScanner();
      }, transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return transitionAnimation(animation, child);
      }),
    );
  }

  // 从下向上弹出，从上向下收回
  static SlideTransition transitionAnimation(
      Animation<double> animation, Widget child) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(0.0, 1.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }

  pushQRCodeScannerWithCustomAnimation2() async {
    // 页面旋转淡出的效果
    transitionAnimation(Animation<double> animation, Widget child) {
      return FadeTransition(
        opacity: animation,
        child: RotationTransition(
          turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
          child: child,
        ),
      );
    }

    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, _, __) => QRCodeScanner(),
        transitionDuration: const Duration(milliseconds: 1000),
        transitionsBuilder: (_, animation, __, child) =>
            transitionAnimation(animation, child),
      ),
    ).then((value) {
      Scaffold.of(context).showSnackBar(
        SnackBar(
          content: Text(value),
          duration: const Duration(seconds: 3),
        ),
      );
    });
  }
  
  pushListView() {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => TestListView()));
  }
}
