import 'package:flutter/material.dart';

import 'package:flutter_app/pageWidgets/bottomBar/ddy_bottom_bar.dart';


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
    );
  }
}
