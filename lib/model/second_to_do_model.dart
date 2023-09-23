class SecondToDoModel {
  int? id;
  String? title;
  String? content;
  String? time;
  List<SubToDo>? subTodoList;
  SubToDo? subTodoMap;
  String? image;

  SecondToDoModel({
    this.id,
    this.image,
    this.title,
    this.content,
    this.time,
    this.subTodoList,
    this.subTodoMap,
  });

  SecondToDoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    content = json['content'];
    time = json['time'];
    image = json['image'];
    subTodoList = (json['sub_todo_list'] as List<Map<String, dynamic>>).map((value) => SubToDo.fromJson(value)).toList();
    subTodoMap = SubToDo.fromJson(json['sub_todo_map']);
  }
}

class SubToDo {
  String? title;
  String? content;
  String? image;

  SubToDo({this.title, this.content, this.image});

  SubToDo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    content = json['content'];
    image = json['image'];
  }
}
