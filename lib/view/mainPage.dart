import 'package:flutter/material.dart';

// メインページ
class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('ToDo List'),
      ),
      body: new Container(
        padding: new EdgeInsets.all(32.0),
        child: new Center(
          child: new Column(
            // 下のほうに設置
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              // 追加ボタン
              FloatingActionButton(
                onPressed: () => Navigator.of(context).pushNamed("/subpage"),
                child: Icon(Icons.add),
              )
            ],
          ),
        ),
      ),
    );
  }
}
