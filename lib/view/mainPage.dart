import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/bloc/work_bloc.dart';
import 'package:flutter_app_todo/model/work.dart';
import 'package:flutter_app_todo/view/components/list.dart';

// メインページ
// リストページ
class MainPage extends StatefulWidget {
  const MainPage({Key key})  : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

class _mainPageState extends State<MainPage> with RouteAware {

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
                  future: WorkBloc().getWorks(From.db),
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

  // ルートオブザーバー
  final RouteObserver<PageRoute> routeObserver = new RouteObserver<PageRoute>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  // 上の画面がpopされて、この画面に戻ったときに呼ばれる
  void didPopNext() {
    debugPrint("didPopNext ${runtimeType}");
  }

  // この画面がpushされたときに呼ばれる
  void didPush() {
    debugPrint("didPush ${runtimeType}");
  }

  // この画面がpopされたときに呼ばれる
  void didPop() {
    debugPrint("didPop ${runtimeType}");
  }

  // この画面から新しい画面をpushしたときに呼ばれる
  void didPushNext() {
    debugPrint("didPushNext ${runtimeType}");
  }
}