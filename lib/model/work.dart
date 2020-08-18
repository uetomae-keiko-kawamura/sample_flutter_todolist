class Work {

  /**
   * field
   */
  int id;         // id
  String title;   // タイトル
  String detail;  // 内容
  DateTime date;  // 期限
  int progress;   // 進捗率（0～100）
  bool end_flg;   // 完了フラグ

  /**
   * Constructor
   */
  Work({this.id,this.title,this.detail,this.date,this.progress,this.end_flg});

  /**
   * method
   */
  Map<String, dynamic> toMap() =>{
    "id" : id,
    "title" : title,
    "detail" : detail,
    "date" : date,
    "progress" : progress,
    "end_flg" : end_flg
  };

  factory Work.fromMap(Map<String, dynamic> map) => Work(
    id : map["id"],
    title: map["title"],
    detail: map["detail"],
    date: map["date"],
    progress: map["progress"],
    end_flg: map["end_flg"]
  );

  factory Work.fromJson(Map<String, dynamic> json) => Work(
    id : json['id'],
    title :json['title'],
    detail: json['detail'],
    date: json['date'],
    progress: json['progress'],
    end_flg: json['end_flg']
  );

  String toString() {
    return "- id:" + id.toString() + ',\n'
        + "- title:" + title + ",\n"
        + "- detail:" + detail + ",\n"
        + "- date" + date.toString() + ",\n"
        + "- progress" + progress.toString() + ",\n"
        + "- end_flg" + end_flg.toString() + "\n";
  }
}