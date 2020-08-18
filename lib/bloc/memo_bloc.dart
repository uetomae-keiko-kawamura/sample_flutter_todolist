import 'package:flutter_app_todo/model/memo.dart';
import 'package:sqflite/sqflite.dart';

/**
 * メモ保存
 */
Future<void> insertMemo(Memo memo) async {
  var database;
  final Database db = await database;
  await db.insert(
    'memo',
    memo.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

/**
 * メモ更新
 */
Future<void> updateMemo(Memo memo) async {
  // Get a reference to the database.
  var database;
  final db = await database;
  await db.update(
    'memo',
    memo.toMap(),
    where: "id = ?",
    whereArgs: [memo.id],
    conflictAlgorithm: ConflictAlgorithm.fail,
  );
}

/**
 * メモ削除
 */
Future<void> deleteMemo(int id) async {
  var database;
  final db = await database;
  await db.delete(
    'memo',
    where: "id = ?",
    whereArgs: [id],
  );
}

/**
 * メモ取得（全件）
 */
Future<List<Memo>> getMemos() async {
  var database;
  final Database db = await database;

  // 全件取得
  final List<Map<String, dynamic>> maps = await db.query('memo');

  // idを指定する場合
  // final id = 1;
  // await db.query('memo', where: 'id = ?', whereArgs: [id]);

  // SQLで書く場合
  // await db.rawQuery('SELECT * FROM memo WHERE id = ?', [id]);

  // LIKE句
  // final text = 'Flutter';
  // await db.query('memo', where: 'text LIKE ?', whereArgs: ['${text}%']);

  // IN句
  // final ids = [1, 2]
  // await db.query('memo', where: 'id IN (${ids.join(', ')})');

  // 実行結果をmapにつめる
  return List.generate(maps.length, (i) {
    return Memo(
      id: maps[i]['id'],
      text: maps[i]['text'],
      priority: maps[i]['priority'],
    );
  });
}

