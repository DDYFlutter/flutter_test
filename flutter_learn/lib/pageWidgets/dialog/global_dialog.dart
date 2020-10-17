import 'package:flutter/material.dart';
import 'dart:async';

enum Action {
  Ok,
  Cancel
}

class GlobalDialog extends StatefulWidget {
  @override
  _GlobalDialogState createState() => _GlobalDialogState();
}

class _GlobalDialogState extends State<GlobalDialog> {
  String _choice = '空空如也';

  Future showGlobalDialog(String message) async {
    
    final action = await showDialog(context: context, barrierDismissible: false, builder: (BuildContext context){
      return AlertDialog(
        title: Text('提示'),
        content: Text('内容：$message'),
        actions: <Widget>[
          FlatButton(
            child: Text('取消'),
            onPressed: () {
              Navigator.pop(context, Action.Cancel);
              },
      ),
          FlatButton(
            child: Text('确认'),
            onPressed: () {
              Navigator.pop(context, Action.Ok);
              },
          ),
        ],
      );
    });

    switch (action) {
      case Action.Ok:
        setState(() {
          _choice = '确定';
        });
        break;
      case Action.Cancel:
        setState(() {
          _choice = '取消';
        });
        break;
      default:
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('啦啦啦'),
        elevation: 0.0,
      ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('选择了: $_choice'),
            SizedBox(height: 16.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('来吧 展示'),
                  onPressed: () {
                    showGlobalDialog("哈哈哈");
                },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}