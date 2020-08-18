import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/model/memo.dart';
import 'package:flutter_app_todo/bloc/memo_bloc.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// メインページ
class MainPage extends StatelessWidget {

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
              Text(testDB ().toString()),
            ],
          ),
        ),
      ),
    );
  }
}

/**
 * データベーステスト
 */
Future testDB () {

  // メモ
  final database = openDatabase(
    join(await getDatabasesPath(), 'memo_database.db'),
    onCreate: (db, version) {
      return db.execute(
        "CREATE TABLE memo(id INTEGER PRIMARY KEY, text TEXT, priority INTEGER)",
      );
    },
    version: 1,
  );
  var memo = Memo(
    id: 0,
    text: 'Flutterで遊ぶ',
    priority: 1,
  );

  insertMemo(memo);

  return getMemos();

  /*

  print(getMemos());

  memo = Memo(
  id: memo.id,
  text: memo.text,
  priority: memo.priority + 1,
  );
  updateMemo(memo);

  // Print Fido's updated information.
  print(getMemos());

  // Delete Fido from the database.
  deleteMemo(memo.id);

  // Print the list of dogs (empty).
  print(getMemos());
*/
}