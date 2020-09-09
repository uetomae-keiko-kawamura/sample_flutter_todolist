import 'package:flutter_app_todo/bloc/api_call.dart';
import 'package:flutter_app_todo/bloc/db_access.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:flutter_app_todo/view/components/common.dart';

/**
 * SQLite "work"へアクセスする
 */

class WorkAccess {
  final ApiCall api = ApiCall();
  final DbAccess db = DbAccess();

  WorkAccess() {}

  /**
   * 保存
   */
  Future<void> insertWork(From value, Work work) async {
    switch (value) {
      case From.api:
        break;

      case From.db:
        db.insertWork(work);
        break;

      default:
        break;
    }
  }

  /**
   * 更新
   */
  Future<void> updateWork(From value, Work work) async {
    switch (value) {
      case From.api:
        break;

      case From.db:
        db.updateWork(work);
        break;

      default:
        break;
    }
  }

  /**
   * 削除
   */
  Future<void> deleteWork(From value, int id) async {
    switch (value) {
      case From.api:
        break;

      case From.db:
        db.deleteWork(id);
        break;

      default:
        break;
    }
  }

  /**
   * 取得（一部）
   */
  Future<List<Work>> getWorks(From value) async {}

  /**
   * 直接取得（全件）
   */
  Future<List<Work>> getWorksAll(From value) async {
    switch (value) {
      case From.api:
        return api.getWorksAll();
        break;
      case From.db:
        return db.getWorksAll();
        break;
      default:
        return db.getWorksAll();
    }
  }
}
