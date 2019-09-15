import 'package:flutter/material.dart';

class QRCodeGenerator extends StatefulWidget {

  String title;

  Function(String value) callbackFunction;

  QRCodeGenerator(this.callbackFunction, {Key outerKey, this.title}) : super(key: outerKey);

  @override
  State<StatefulWidget> createState() {
    return _QRCodeGeneratorState();
  }
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title ?? '生成二维码'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.print),
            onPressed: () {
              if (widget.callbackFunction != null) {
                widget.callbackFunction('回调数据');
              }
            },
          ),
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