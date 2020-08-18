import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/model/work.dart';

// サブページ
class SubPage extends StatelessWidget {
  @override
  Work work = new Work();
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ToDo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            // 左寄せ
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('内容'),
              new TextField(
                enabled: true,
                maxLength: 80,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.blueGrey),
                obscureText: false,
                maxLines: 1,
                onChanged: (title) {
                  this.work.title = title;
                },
              ),
              RaisedButton(onPressed: () => Navigator.of(context).pop(), child: new Text('保存'),),
              RaisedButton(onPressed: () => Navigator.of(context).pop(), child: new Text('戻る'),)
            ],
          ),
        ),
      ),
    );
  }

  // 保存
  void pressdSaveButton(BuildContext context) {
    return Navigator.of(context).pop();
  }
}