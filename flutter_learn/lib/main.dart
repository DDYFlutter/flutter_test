import 'package:flutter/material.dart';

import 'package:flutter_learn/pageWidgets/bottomBar/ddy_bottom_bar.dart';
import 'package:flutter_learn/pageWidgets/qrcode/qrcode_scanner.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        primarySwatch: Colors.blue,
      ),
      home: DDYBottomBar(),
      showPerformanceOverlay: false,
      routes: {
        '/home/qrcode': (BuildContext context) => QRCodeScanner(title: '0',),
        '/home_qrcode': (BuildContext context) => QRCodeScanner(title: '1',),
        '+home_qrcode': (BuildContext context) => QRCodeScanner(title: '2',),
      },
    );
  }
}