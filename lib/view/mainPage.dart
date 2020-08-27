import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/bloc/api_call.dart';
import 'package:flutter_app_todo/bloc/work_bloc.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:path/path.dart';

// メインページ
class MainPage extends StatelessWidget {
  int _currentIndex = 0;
  String _test = "test";
  final _pageWidgets = [
    PageWidget(color:Colors.white, title:'Home'),
    PageWidget(color:Colors.blue, title:'Add'),
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
                      future: ApiCall().getWorks(),
                      builder: (context, future) {
                        if (!future.hasData) {
                          return Center(child: CircularProgressIndicator());
                        } else {
                          return ListView.builder(
                              padding: const EdgeInsets.all(16.0),
//                            controller: listScrollController,
                              itemCount: future.data.length,
                              itemBuilder: (context, index) {
                                return _listItem(future.data.toList()[index].task, future.data[index].person);
                              }
                          );
                        }
                      }
                  ),

              ),
              FloatingActionButton(
                backgroundColor: Colors.redAccent,
                child: new Icon(Icons.add_circle),
                onPressed: () {
                  Navigator.of(context).pushNamed("/subpage");
                },
              )
            ]
        ),
 /*
        bottomNavigationBar: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
            BottomNavigationBarItem(icon: Icon(Icons.add), title: Text('Add')),
          ],
          currentIndex: _currentIndex,
          fixedColor: Colors.blueAccent,
//          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          // AddタップでsubPageへ
          onTap: (int index) {
            print("index" + index.toString());
            if (index == 1) {
              Navigator.of(context).pushNamed("/subpage");
            }
          },
        )
*/
    );
  }
//  void _onItemTapped(int index) => setState(() => _currentIndex = index );
  // リストアイテム
  Widget _listItem(String title, String subtitle) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child: CheckboxListTile(
        title: Text(
          title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 18.0
          ),
        ),
        subtitle: Text(subtitle),
        activeColor: Colors.orange,
      ),
    );
  }
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