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
              // "https://aws-rtmp.s3-ap-northeast-1.amazonaws.com/kitchn.mp4"      // 通常再生
              "https://aws-rtmp.s3-ap-northeast-1.amazonaws.com/kitchn/kitchn.m3u8" // ストリーミング再生
            ),
          )
      ),
    );
  }
}