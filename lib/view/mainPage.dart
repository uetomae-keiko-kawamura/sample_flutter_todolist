import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/bloc/work_bloc.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:flutter_app_todo/view/subPage.dart';
import 'package:flutter_app_todo/view/components/list.dart';
import 'package:flutter_app_todo/view/components/constants.dart';

// メインページ
class MainPage extends StatelessWidget {
  final WorkBloc workBloc = new WorkBloc(From.db);

  dispose() {
    workBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    workBloc.getWorksAll();
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ToDo List'),
      ),
      body: Column(children: <Widget>[
        Expanded(
          child: StreamBuilder<List<Work>>(
              stream: workBloc.works,
              builder:
                  (BuildContext context, AsyncSnapshot<List<Work>> snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  List<Work> _list = snapshot.data.toList();
                  return ListView.builder(
                      padding: const EdgeInsets.all(16.0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (context, index) {
                        return ListItem(_list[index].task, _list[index].person);
                      });
                }
              }),
        ),
        new Align(
            alignment: Alignment.bottomRight,
            child: Container(
                padding: EdgeInsets.all(20.0),
                child: FloatingActionButton(
                  backgroundColor: Colors.orangeAccent,
                  child: new Icon(Icons.add),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SubPage(workBloc)));
                  },
                )))
      ]),
    );
  }
}
