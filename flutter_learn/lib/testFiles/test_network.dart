import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:isolate';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class TestNetwork {

  startTest() {
    _testNativeNetRequest();
    _testLibraryHttp();
  }
  
  // 不建议用原生方法请求
  _testNativeNetRequest() async {
    var url = 'https://raw.githubusercontent.com/DDYFlutter/flutter_test/master/interface.js';
    var httpClient = new HttpClient();
    try {
      var request = await httpClient.getUrl(Uri.parse(url));
      var response = await request.close();
      // 原生库禁掉了OK
      if (response.statusCode == 200) {
        print('原生 httpClient success ${await response.transform(Utf8Decoder()).join()}');
      } else {
        print('原生 httpClient Error: ${response.statusCode}');
      }
    } catch(exception) {
      print('原生 httpClient Error: ${exception}');
    }
  }

  // 测试HTTP https://pub.dartlang.org/packages/http
  _testLibraryHttp() async {
    var url = 'https://raw.githubusercontent.com/DDYFlutter/flutter_test/master/interface.js';
    var client = new http.Client();
    try {
      http.Response response = await client.get(url);
      if (response.statusCode == 200) {
        print('http success ${response.body.toString()}');
      } else {
        print('http Error: ${response.statusCode}');
      }
    } catch(exception) {
      print('http Error: ${exception}');
    }
  }

  // 测试dio https://pub.dartlang.org/packages/dio
  _testDio() async {
    try {
      var url = 'https://raw.githubusercontent.com/DDYFlutter/flutter_test/master/interface.js';
      var dio = new Dio();
      var response = await dio.get(url);
      if (response.statusCode == 200) {
        print('dio success ${response.data.toString()}');
      } else {
        print('dio Error: ${response.statusCode}');
      }
    } catch(exception) {
      print('dio Error: ${exception}');
    }
  }

}


