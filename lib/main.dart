import 'package:flutter/material.dart';
import 'package:flutter_app_todo/view/mainPage.dart';
import 'package:flutter_app_todo/view/subPage.dart';
import 'package:flutter_app_todo/model/work.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // ルートオブザーバー
  final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

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
      home: MainPage(),
      // 画面遷移を設定
      routes: <String, WidgetBuilder> {
        '/home' : (BuildContext context) => new MainPage(),
        '/subpage' : (BuildContext context) => new SubPage()
      },
      // ルートオブザーバー
      navigatorObservers: <NavigatorObserver>[routeObserver],
    );
  }
}