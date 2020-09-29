import 'package:flutter/material.dart';
import 'package:flutter_app_todo/model/work.dart';

// リストアイテム
class ListItem extends StatefulWidget {
  String _title = "";
  String _subtitle = "";
  int _id = -1;

  ListItem(Work work) {
    _title = work.task;
    if (work.person != null) {
      _subtitle = work.person;
    } else {
      _subtitle = "";
    }
    _id = work.id;
  }

  @override
  _ListItemState createState() => _ListItemState();
}

class _ListItemState extends State<ListItem> {
  bool _check = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: new BoxDecoration(
          border:
              new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))),
      child: CheckboxListTile(
          title: Text(
            widget._title,
            style: TextStyle(color: Colors.black, fontSize: 18.0),
          ),
          subtitle: Text(widget._subtitle),
          activeColor: Colors.orange,
          value: _check,
          onChanged: (bool val) {
            setState(() {
              _check = val;
            });
            print(widget._title);
            print(widget._id);
            print(_check);
          }),
    );
  }
}
