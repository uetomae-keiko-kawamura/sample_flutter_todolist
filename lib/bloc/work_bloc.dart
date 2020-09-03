import 'dart:async';
import 'package:flutter_app_todo/bloc/api_call.dart';
import 'package:flutter_app_todo/bloc/db_access.dart';
import 'package:flutter_app_todo/model/work.dart';

enum From {
  api,
  db
}

class WorkBloc {

  final ApiCall api = ApiCall();
  final DbAccess db = DbAccess();

  WorkBloc(){}

  /**
   * 保存
   */
  Future<void> insertWork(From value,Work work) async {

    switch (value) {
      case From.api :
        break;

      case From.db :
        db.insertWork(work);
        break;

      default:
        break;
    }
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
  Future<List<Work>> getWorks(From value) async {
    switch (value) {
      case From.api :
        return api.getWorks();
        break;
      case From.db :
        return db.getWorks();
        break;
      default:
        return db.getWorks();
    }
    //return api.getWorks();
    //return List.of([new Work(id: "1", task: "work"), new Work(id: "2", task: "二行目"), new Work(id: "3", task: "test")]);
  }
}