import 'dart:async';
import 'package:flutter_app_todo/bloc/api_call.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app_todo/model/work.dart';

class WorkBloc {

  WorkBloc(){}
  final ApiCall api = ApiCall();

  /**
   * 保存
   */
  Future<void> insertWork(Work work) async {
    var database;
    final Database db = await database;
    await db.insert(
      'work',
      work.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  /**
   * 更新
   */
  Future<void> updateWork(Work work) async {
    // Get a reference to the database.
    var database;
    final db = await database;
    await db.update(
      'work',
      work.toMap(),
      where: "id = ?",
      whereArgs: [work.id],
      conflictAlgorithm: ConflictAlgorithm.fail,
    );
  }

  /**
   * 削除
   */
  Future<void> deleteWork(int id) async {
    var database;
    final db = await database;
    await db.delete(
      'work',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /**
   * 取得（全件）
   */
  Future<List<Work>> getWorks() async {
    return api.getWorks();
//    return List.of([new Work(id: "1", task: "work"), new Work(id: "2", task: "二行目"), new Work(id: "3", task: "test")]);
/*
    var database;

    final Database db = await database;

    // 全件取得
    final List<Map<String, dynamic>> maps = await db.query('work');

    // 実行結果をmapにつめる
    return List.generate(maps.length, (i) {
      return Work(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
 */
  }

  /**
   * データベーステスト
   */
  Future<List<Work>> testWorkDB () async{

    // メモ
    final Future<Database> database = openDatabase(
          join(await getDatabasesPath(), 'work_database.db'),
          onCreate: (db, version) {
        return db.execute(
        "CREATE TABLE work(id INTEGER PRIMARY KEY, title TEXT)",
        );
      },
      version: 1,
    );

    var work = Work(
      id: "0",
      task: 'work',
    );

//    await insertWork(work);

    work = Work(
      id: "1",
      task: "二行目",
    );
//    await insertWork(work);

    return getWorks();

  }
}