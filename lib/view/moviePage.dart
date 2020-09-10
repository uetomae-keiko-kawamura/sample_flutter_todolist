import 'package:flutter/material.dart';
import 'package:flutter_app_todo/view/components/moviePlayerWidget.dart';

class MoviePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("動画再生テスト"),
      ),
      body: Center(
          child: Container(
            child: MoviePlayerWidget(
              "http://egaoinc.xsrv.jp/egao-blog/movie/sample-movie.mp4",
            ),
          )
      ),
    );
  }
}