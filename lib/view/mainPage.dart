import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/model/memo.dart';
import 'package:flutter_app_todo/bloc/memo_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// メインページ
class MainPage extends StatelessWidget {
  final memo_bloc = MemoBloc();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ToDo List'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            // 下のほうに設置
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // 追加ボタン
              FloatingActionButton(
                onPressed: () => Navigator.of(context).pushNamed("/subpage"),
                child: Icon(Icons.add),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

