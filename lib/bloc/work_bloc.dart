import 'dart:async';
import 'package:rxdart/rxdart.dart';

import 'package:flutter_app_todo/bloc/api_call.dart';
import 'package:flutter_app_todo/bloc/db_access.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:flutter_app_todo/view/components/constants.dart';

class WorkBloc {
  From _from;
  final ApiCall api = ApiCall();
  final DbAccess db = DbAccess();

  // Stream設定
  final _worksController = BehaviorSubject<List<Work>>.seeded([]);
  Sink<List<Work>> get worksSink => _worksController.sink;
  Stream<List<Work>> get works => _worksController.stream;

  WorkBloc(From value) {
    _from = value;
  }

  dispose() {
    _worksController.close();
  }

  void syncDB() async {
    // TODO:
    // Synchronize DBs between the server one and the local one.
    // 1. get the works in the server DB.
    // 2. compare it to the works in the local DB.
    // 3. if different number of the works between those, insert / update the ones in local.
    // 4. put a step that calls this function.
  }

  /**
   * 保存
   */
  void insertWork(Work work) async {
    try {
      switch (_from) {
        case From.api:
          api.insertWork(work);
          worksSink.add(await api.getWorksAll());
          break;

        case From.db:
          db.insertWork(work);
          worksSink.add(await db.getWorksAll());
          break;

        default:
          break;
      }
    } catch (e) {
      print(e);
      db.insertWork(work);
      worksSink.add(await db.getWorksAll());
    }
  }

  /**
   * 更新
   */
  void updateWork(Work work) async {
    try {
      switch (_from) {
        case From.api:
          api.updateWork(work);
          worksSink.add(await api.getWorksAll());
          break;

        case From.db:
          db.updateWork(work);
          worksSink.add(await db.getWorksAll());
          break;

        default:
          break;
      }
    } catch (e) {
      print(e);
      db.updateWork(work);
      worksSink.add(await db.getWorksAll());
    }
  }

  /**
   * 削除
   */
  Future<void> deleteWork(int id) async {
    try {
      switch (_from) {
        case From.api:
          worksSink.add(await api.getWorksAll());
          break;

        case From.db:
          db.deleteWork(id);
          worksSink.add(await db.getWorksAll());
          break;

        default:
          break;
      }
    } catch (e) {
      print(e);
      db.deleteWork(id);
      worksSink.add(await db.getWorksAll());
    }
  }

  /**
   * 取得（一部）
   */
  void findWorks() async {}

  /**
   * 直接取得（全件）
   */
  void getWorksAll() async {
    try {
      switch (_from) {
        case From.api:
          worksSink.add(await api.getWorksAll());
          break;
        case From.db:
          worksSink.add(await db.getWorksAll());
          break;
        default:
          break;
      }
    } catch (e) {
      print(e);
      worksSink.add(await db.getWorksAll());
    }
  }
}
