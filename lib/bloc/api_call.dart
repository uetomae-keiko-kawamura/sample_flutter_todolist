import 'package:flutter_app_todo/model/work.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall {
  String _url =
      "https://zkcisny52m.execute-api.ap-northeast-1.amazonaws.com/prod/api/todo/list";

  ApiCall() {}
  /**
   * 保存
   */
  Future<void> insertWork(Work work) async {}

  /**
   * 更新
   */
  Future<void> updateWork(Work work) async {}

  /**
   * 削除
   */
  Future<void> deleteWork(int id) async {}

  Future<List<Work>> getWorksAll() async {
    return http.get(_url).then((response) {
      List<Work> tasks = [];

      switch (response.statusCode) {
        case 200:
          List<dynamic> items = json.decode(response.body);
          tasks = items.map((e) => Work.fromJson(e)).toList();

          break;

        default:
          break;
      }
      return tasks;
    });
  }
}
