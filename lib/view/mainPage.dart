import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/bloc/work_bloc.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:flutter_app_todo/view/components/list.dart';

// メインページ
// APIを利用したリストページ
class MainPage extends StatelessWidget {
  int _currentIndex = 0;
  String _test = "test";

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ToDo List'),
      ),
      body: Column(
          children: <Widget>[
            Expanded(
              child: FutureBuilder<List<Work>>(
                  future: WorkBloc().getWorks(),
                  builder: (context, future) {
                    if (!future.hasData) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      List<Work> _list = future.data.toList();
                      return ListView.builder(
                          padding: const EdgeInsets.all(16.0),
//                            controller: listScrollController,
                          itemCount: future.data.length,
                          itemBuilder: (context, index) {
                            return ListItem(
                                _list[index].task, _list[index].person);
                          }
                      );
                    }
                  }
              ),

            ),
            new Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  padding: EdgeInsets.all(20.0),
                    child : FloatingActionButton(
                      backgroundColor: Colors.orangeAccent,
                      child: new Icon(Icons.add),
                      onPressed: () {
                        Navigator.of(context).pushNamed("/subpage");
                      },
                    )
                )
            )
          ]
      ),
    );
  }
//  void _onItemTapped(int index) => setState(() => _currentIndex = index );
}
class PageWidget extends StatelessWidget {
  final Color color;
  final String title;

  PageWidget({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      color: color,
      child: Center(
        child: Text(
          title,
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }

}