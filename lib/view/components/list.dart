import 'package:flutter/material.dart';

// リストアイテム
class ListItem extends StatefulWidget {
  String _title = "";
  String _subtitle = "";

  ListItem(String title, String subtitle) {
    _title = title;
    _subtitle = subtitle;
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
          border: new Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
      ),
      child: CheckboxListTile(
          title: Text(
            widget._title,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0
            ),
          ),
          subtitle: Text(widget._subtitle),
          activeColor: Colors.orange,
          value: _check,
          onChanged: (bool val) {
            setState(() {
              _check = val;
              print(val);
            });
          }
      ),
    );
  }
}
