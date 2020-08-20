class Memo {
  final int id;
  final String text;
  final int priority;

  Memo({this.id, this.text, this.priority});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'priority': priority,
    };
  }

  @override
  String toString() {
    return 'Memo{id: $id, tet: $text, priority: $priority}';
  }
}
