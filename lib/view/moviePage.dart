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
              "https://aws-rtmp.s3-ap-northeast-1.amazonaws.com/VD00001.mp4",
              // ストリーミング再生にする場合は変換が必要
            ),
          )
      ),
    );
  }
}