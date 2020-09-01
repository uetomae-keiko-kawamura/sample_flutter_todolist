import 'dart:async';
import 'package:flutter_app_todo/bloc/api_call.dart';
import 'package:flutter_app_todo/bloc/db_access.dart';
import 'package:flutter_app_todo/model/work.dart';

class WorkBloc {

  final ApiCall api = ApiCall();
  final DbAccess db = DbAccess();

  WorkBloc(){}

  /**
   * 保存
   */
  Future<void> insertWork(Work work) async {
  }

  /**
   * 更新
   */
  Future<void> updateWork(Work work) async {
  }

  /**
   * 削除
   */
  Future<void> deleteWork(int id) async {
  }

  /**
   * 取得（全件）
   */
  Future<List<Work>> getWorks() async {
    return db.getWorks();
    //return api.getWorks();
    //return List.of([new Work(id: "1", task: "work"), new Work(id: "2", task: "二行目"), new Work(id: "3", task: "test")]);
  }
}