import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_todo/view/moviePage.dart';
import 'package:flutter_app_todo/view/todoListPage.dart';
import 'package:flutter_app_todo/view/arkitPage.dart';

// HOME
class MainPage extends StatefulWidget {
  // ナビげーションバーアイテムと対応するページのリスト
  final List<Map<String, dynamic>> pages = [
    {
      "label":
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Home')),
      "page": TodoListPage()
    },
    {
      "label": BottomNavigationBarItem(
          icon: Icon(Icons.movie), title: Text('Movie')),
      "page": MoviePage()
    },
    {
      "label": BottomNavigationBarItem(
          icon: Icon(Icons.photo_camera), title: Text('AR')),
      "page": ArkitPage()
    },

  ];

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MainPage>
    with SingleTickerProviderStateMixin {
  // ページ切り替え用のコントローラを定義
  PageController _pageController;

  // ページインデックス保存用
  int _screenIndex = 0;

  @override
  void initState() {
    super.initState();
    // コントローラ作成
    _pageController = PageController(
      initialPage: _screenIndex, // 初期ページの指定。上記で_screenを１とすれば２番目のページが初期表示される。
    );
  }

  @override
  void dispose() {
    // コントローラ破棄
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> pageList = [];
    widget.pages.forEach((el) {
      pageList.add(el["label"]);
    });
    return Scaffold(
      body: widget.pages[_screenIndex]["page"],
      bottomNavigationBar: BottomNavigationBar(
        items: pageList,
        currentIndex: _screenIndex,
        onTap: (int index) {
          setState(() {
            _screenIndex = index;
          });
        },
      ),
    );
  }
}
