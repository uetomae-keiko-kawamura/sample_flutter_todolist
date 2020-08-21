import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiCall {
  String _url;
  int statusCode;
  List<String> data;

  ApiCall(){}

  void init() {
    _url = "https://zkcisny52m.execute-api.ap-northeast-1.amazonaws.com/prod/api/todo/list";
    data = null;
    statusCode = -1;
  }

  void initWithUrl(String url) {
    _url = url;
    data = null;
    statusCode = -1;
  }

  void fetchPosts() async {
    http.get(_url).then((response) {
      statusCode = response.statusCode;
      switch (response.statusCode) {
        case 200 :
          print(response.body);
          List list = json.decode(response.body);
          data = list.map<String>((value) {
            return value['title'];
          }).toList();
          break;

        default:
          print(response.statusCode);
      }
    });
  }
}