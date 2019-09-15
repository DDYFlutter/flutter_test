import 'package:flutter/material.dart';

class QRCodeScanner extends StatefulWidget {

  String title;

  QRCodeScanner({Key outerKey, this.title}) : super(key: outerKey);

  @override
  State<StatefulWidget> createState() {
    return _QRCodeScannerState();
  }
}

class _QRCodeScannerState extends State<QRCodeScanner> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? '扫描二维码'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.home), onPressed: (){
//            Navigator.of(context).pop();
//          Navigator.pop(context);
          Navigator.of(context).pop('回调数据');
          }),
        ],
      ),
      body: SelectableText(
        '这是一个可选择的文本\nThis is a SelectableText',
        style: TextStyle(fontSize: 20.0),
        autofocus: true,
      ),
    );
  }

}