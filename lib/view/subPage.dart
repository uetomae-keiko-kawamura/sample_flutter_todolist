import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/model/work.dart';

enum Answers{
  YES,
  NO
}

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
                onChanged: (task) {
                  this.work.task = task;
                },
              ),
              RaisedButton(onPressed: () => openDialog(context), child: new Text('保存'),),
              RaisedButton(onPressed: () => Navigator.of(context).pop(), child: new Text('戻る'),)
            ],
          ),
      ),
    );
  }

//  String _value = '';


// ダイアログ表示
  void openDialog(BuildContext context) {
    showDialog<Answers>(
      context: context,
      builder: (BuildContext context) => new SimpleDialog(
        title: new Text("ここに内容を出したいがwork.taskを入れるとエラーになる"),
        children: <Widget>[
          createDialogOption(context, Answers.YES, 'OK')
        ],
      ),
    ).then((value) {
      switch(value) {
        case Answers.YES:
//          _setValue('Yes');
          break;
        case Answers.NO:
//          _setValue('No');
          break;
      }
    });
  }


  createDialogOption(BuildContext context, Answers answer, String str) {
    return new SimpleDialogOption(child: new Text(str),onPressed: (){Navigator.pop(context, answer);},);
  }
}