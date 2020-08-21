class Work {

  /**
   * field
   */
  int id;           // id
  String task;      // タスク
  DateTime duedate; // 期日
  String person;    // 登録者
  bool end_flg;

  /**
   * Constructor
   */
  Work({this.id,this.task,this.duedate,this.person,this.end_flg});

  /**
   * method
   */
  Map<String, dynamic> toMap() =>{
    "id" : id,
    "title" : task,
    "date" : duedate,
    "progress" : person,
    "end_flg" : end_flg
  };

  factory Work.fromMap(Map<String, dynamic> map) => Work(
    id : map["id"],
    task: map["task"],
    duedate: map["duedate"],
    person: map["person"],
    end_flg: map["end_flg"]
  );

  factory Work.fromJson(Map<String, dynamic> json) => Work(
    id : json['id'],
    task :json['task'],
    duedate: json['duedate'],
    person: json['person'],
    end_flg: json['end_flg']
  );

  @override
  String toString() {
    return "- id:" + id.toString() + ',\n'
        + "- task:" + task + ",\n"
        + "- duedate:" + duedate.toString() + ",\n"
        + "- person" + person.toString() + ",\n"
        + "- end_flg" + end_flg.toString() + "\n";
  }
}