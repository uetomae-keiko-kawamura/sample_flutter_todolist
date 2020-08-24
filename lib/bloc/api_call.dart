import 'package:flutter_app_todo/model/work.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall {
  int statusCode;
  String _url = "https://zkcisny52m.execute-api.ap-northeast-1.amazonaws.com/prod/api/todo/list";

  ApiCall(){}

  Future<List<Work>> getWorks() async {
    List<Work> tasks = [];
    http.get(_url).then((response) {
      statusCode = response.statusCode;
      print(response.statusCode);

      switch (response.statusCode) {
        case 200 :
          print(response.body);
          List items = json.decode(response.body);
          items.map<String>((value) {
            tasks.add(Work.fromMap(value)
            );
          }).toList();
          break;
        default:
          break;
      }
    });
    return tasks;
  }
}