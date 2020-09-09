import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/bloc/work_access.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:flutter_app_todo/bloc/work_bloc.dart';
import 'package:flutter_app_todo/view/components/common.dart';

// サブページ
class SubPage extends StatelessWidget {
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  Work work = new Work();

  // 入力欄からデータを取り出すためのストリームを設定
  var _taskControler = TextEditingController();
  var _personControler = TextEditingController(text: "自分");

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: new AppBar(
        title: new Text('ToDo'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: SingleChildScrollView(
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
                controller: _taskControler,
                onChanged: (task) {
                  this.work.task = _taskControler.text;
                },
              ),
              Text("やる人"),
              new TextField(
                enabled: true,
                maxLength: 80,
                maxLengthEnforced: false,
                style: TextStyle(color: Colors.blueGrey),
                obscureText: false,
                maxLines: 1,
                controller: _personControler,
                onChanged: (person) {
                  this.work.person = _personControler.text;
                },
              ),
              RaisedButton(
                onPressed: () => openDialog(context),
                child: new Text('保存'),
              ),
              RaisedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: new Text('戻る'),
              )
            ],
          ),
        ),
      ),
    );
  }

//  String _value = '';

  // タスク保存
  void saveWork(BuildContext context) async {
    await WorkAccess().insertWork(From.db, this.work);
    WorkBloc().refresh(From.db);
    Navigator.of(context).pop();
  }

// ダイアログ表示
  void openDialog(BuildContext context) {
    if (work.task == null || work.task.length == 0) {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: const Text('内容を入力してください。'),
        duration: const Duration(seconds: 5),
        action: SnackBarAction(
          label: 'OK',
          onPressed: () {},
        ),
      ));
    } else {
      showDialog<Answers>(
        context: context,
        builder: (BuildContext context) => new SimpleDialog(
          title: new Text(work.task),
          children: <Widget>[createDialogOption(context, Answers.YES, 'OK')],
        ),
      ).then((value) {
        switch (value) {
          case Answers.YES:
            saveWork(context);
//          _setValue('Yes');
            break;
          case Answers.NO:
//          _setValue('No');
            break;
        }
      });
    }
  }

  createDialogOption(BuildContext context, Answers answer, String str) {
    return new SimpleDialogOption(
      child: new Text(str),
      onPressed: () {
        Navigator.pop(context, answer);
      },
    );
  }
}
