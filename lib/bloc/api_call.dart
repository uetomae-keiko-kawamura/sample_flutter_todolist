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
//      print(response.statusCode);

      switch (response.statusCode) {
        case 200 :
//          print("resonseBody:"+response.body);
          List items = json.decode(response.body);
          items.forEach((element) {
//            print("element:" + element.toString());
            String _id = element["id"].toString();
            String _task = element["task"];
            String _person = element["person"];
            tasks.add(Work(
              id: _id,
              task: _task,
              person : _person
            ));
          });

          break;
        default:
          break;
      }
    });
    return tasks;
  }
}