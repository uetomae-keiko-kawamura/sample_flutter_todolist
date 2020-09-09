import 'package:flutter/material.dart';
import 'package:flutter_app_todo/view/mainPage.dart';
import 'package:flutter_app_todo/view/subPage.dart';
import 'package:flutter_app_todo/view/components/common.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // タイトル
      title: 'ToDo',
      // テーマ
      theme: ThemeData(
        // アンバーを指定
        primarySwatch: Colors.amber,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MainPage(From.db),
      // 画面遷移を設定
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => new MainPage(From.db),
        '/subpage': (BuildContext context) => new SubPage()
      },
    );
  }
}
