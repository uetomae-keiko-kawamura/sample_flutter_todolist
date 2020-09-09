import 'package:flutter_app_todo/view/components/common.dart';
import 'package:rxdart/rxdart.dart';

import 'dart:async';
import 'package:flutter_app_todo/model/work.dart';
import 'package:flutter_app_todo/bloc/work_access.dart';

class WorkBloc {
  WorkBloc();

  // Stream設定
  final _dbItemsController = BehaviorSubject<List<Work>>.seeded(null);
  Sink<List<Work>> get dbItemsSink => _dbItemsController.sink;
  Stream<List<Work>> get dbItems => _dbItemsController.stream;

  dispose() {
    _dbItemsController.close();
  }

  /**
   * Stream更新
   */
  void refresh(From value) async {
    switch (value) {
      case From.db:
        dbItemsSink.add(await WorkAccess().getWorksAll(value));
    }
  }
}
