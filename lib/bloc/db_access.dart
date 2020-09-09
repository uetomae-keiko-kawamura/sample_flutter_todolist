import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter_app_todo/model/work.dart';

class DbAccess {
  DbAccess();

  // TODO: ローカルのSQLiteへの接続処理を書く
  /**
   * データベース接続
   */
  Future<Database> _connectDB() async {
    try {
      final Future<Database> database = openDatabase(
        join(await getDatabasesPath(), 'work_database.db'),
        onCreate: (db, version) {
          return db.execute(
            "CREATE TABLE work ("
            "id INTEGER PRIMARY KEY AUTOINCREMENT,"
            "task TEXT,"
            "duedate TEXT,"
            "person TEXT,"
            "end_flg TEXT)",
          );
        },
        version: 1,
      );
      return database;
    } catch (e) {
      print(e);
    }
  }

  /**
   * 保存
   */
  Future<void> insertWork(Work work) async {
// Get a reference to the database.
    try {
      final Database db = await _connectDB();
      await db.insert(
        'work',
        work.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    } catch (e) {
      print("db_access.insertWork\n");
      print(e);
    }
  }

  /**
   * 更新
   */
  Future<void> updateWork(Work work) async {
// Get a reference to the database.
    final Database db = await _connectDB();
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
// Get a reference to the database.
    final Database db = await _connectDB();
    await db.delete(
      'work',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  /**
   * 取得（全件）
   */
  Future<List<Work>> getWorksAll() async {
// Get a reference to the database.
    try {
      final Database db = await _connectDB();
      // 全件取得
      final List<Map<String, dynamic>> maps = await db.query('work');

      // 実行結果をmapにつめる
      return List.generate(maps.length, (i) {
        return Work(
            id: maps[i]['id'],
            task: maps[i]['task'],
            duedate: maps[i]['duedate'],
            person: maps[i]['person'],
            end_flg: maps[i]['end_flg']);
      });
    } catch (e) {
      print(e);
    }
  }
}
