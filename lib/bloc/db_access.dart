import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app_todo/model/work.dart';

class DbAccess {
  DbAccess();

  /**
   * データベース接続
   */
  Future<Database> _connectDB() async {
    try {
      String dbPath = await getDatabasesPath();

      // Try this step once, when you update the DB scheme.
      //deleteDatabase(join(dbPath, 'work_database.db'));

      Future<Database> database = openDatabase(
        join(dbPath, 'work_database.db'),
        version: 1,
        onCreate: (db, version) async {
          return await db.execute(''' 
            CREATE TABLE work (
              id INTEGER PRIMARY KEY AUTOINCREMENT,
              task TEXT,
              duedate TEXT,
              person TEXT,
              end_flg TEXT
            );
            ''');
        },
      );
      return database;
    } catch (e) {
      print(e); // ERROR
    }
  }

  /**
   * 保存
   */
  Future<void> insertWork(Work work) async {
    try {
      final Database db = await _connectDB();
      int result = await db.insert(
        'work',
        work.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      print(result); // DEBUG insert
    } catch (e) {
      print(e); // ERROR
    }
  }

  /**
   * 更新
   */
  Future<void> updateWork(Work work) async {
    try {
      final Database db = await _connectDB();
      int result = await db.update(
        'work',
        work.toMap(),
        where: "id = ?",
        whereArgs: [work.id],
        conflictAlgorithm: ConflictAlgorithm.fail,
      );
      print(result); // DEBUG update
    } catch (e) {
      print(e); // ERROR
    }
  }

  /**
   * 削除
   */
  Future<void> deleteWork(int id) async {
    try {
      final Database db = await _connectDB();
      int result = await db.delete(
        'work',
        where: "id = ?",
        whereArgs: [id],
      );
      print(result); // DEBUG delete
    } catch (e) {
      print(e); // ERROR
    }
  }

  /**
   * 取得（全件）
   */
  Future<List<Work>> getWorksAll() async {
    try {
      Database db = await _connectDB();
      List<Map<String, dynamic>> maps = await db.query('work');
      return maps.map((e) => Work.fromMap(e)).toList();
    } catch (e) {
      print(e); // ERROR
    }
  }
}
