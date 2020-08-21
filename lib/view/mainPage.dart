import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/bloc/work_bloc.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:path/path.dart';

// メインページ
class MainPage extends StatelessWidget {
  int _currentIndex = 0;
  final _pageWidgets = [
    PageWidget(color:Colors.white, title:'Home'),
    PageWidget(color:Colors.blue, title:'Album'),
  ];
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
                        }
                        return ListView.builder(
//                  controller: listScrollController,
                            itemCount: future.data.length,
                            itemBuilder: (context, index) {
                              return Text(future.data.toList()[index].title);
                            }
                        );
                      }
                  )
              )
            ]
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Add')),
          ],
          currentIndex: _currentIndex,
          fixedColor: Colors.blueAccent,
//          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
        )
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