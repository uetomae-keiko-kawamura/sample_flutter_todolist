import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/bloc/work_bloc.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:flutter_app_todo/view/moviePage.dart';
import 'package:flutter_app_todo/view/subPage.dart';
import 'package:flutter_app_todo/view/components/list.dart';
import 'package:flutter_app_todo/view/components/constants.dart';

// メインページ
class MainPage extends StatelessWidget {
  final WorkBloc workBloc = new WorkBloc();

  dispose() {
    workBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    workBloc.getWorksAll();
    return new Scaffold(
      appBar: new AppBar(
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: new Text('ToDo List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save_alt,
              color: Colors.black,
// TODO onPressedに更新を実装
            ),
          ),
        ],
      ),
      drawer: Drawer(
          child: ListView(
            children: <Widget>[
              Container(
                height: 65.0,
                child: DrawerHeader(
                  child: Text(
                    "MENU",
                    style: TextStyle(color: Colors.black, fontSize: 18.0),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber,
                  ),
                ),
              ),
              ListTile(
                title: Text(
                  "動画再生テスト",
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
                trailing: Icon(Icons.movie),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MoviePage()));
            },
          ),
        ],
      )),
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
