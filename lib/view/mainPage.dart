import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/bloc/work_bloc.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:path/path.dart';

// メインページ
class MainPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ToDo List'),
      ),
      body: Column (
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (BuildContext context, int index){
                return Text(
                  "確認",
                  style: TextStyle(fontSize: 20),
                );
              }),
          )
        ]
      )
/*
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
 */
    );
  }