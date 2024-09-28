import 'dart:convert';

class Todo {
  final int? id;
  final String? title;
  final String? content;
  final bool? isCompleted;
  final String? time;
  final String? date;
  Todo({
    this.id,
    this.title,
    this.content,
    this.isCompleted = false,
    this.time,
    this.date,
  });

  Todo copyWith({
    int? id,
    String? title,
    String? content,
    bool? isCompleted,
    String? time,
    String? date,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      isCompleted: isCompleted ?? this.isCompleted,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'content': content,
      'is_completed': isCompleted == true ? 1 : 0,
      'time': time,
      'date': date,
    };
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'] as int,
      title: map['title'] != null ? map['title'] as String : null,
      content: map['content'] != null ? map['content'] as String : null,
      isCompleted: map['is_completed'] as int == 1,
      time: map['time'] != null ? map['time'] as String : null,
      date: map['date'] != null ? map['date'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Todo.fromJson(String source) =>
      Todo.fromMap(json.decode(source) as Map<String, dynamic>);
}
