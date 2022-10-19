import 'package:equatable/equatable.dart';

class Task extends Equatable {
  String title;
   String description;
  String id;
  String date;
  bool? isDone;
  bool? isDelete;
  bool? isFavorite;
  Task({
    required this.title,
    required this.description,
     required this.id,
     required this.date,
    this.isDone,
    this.isDelete,
    this.isFavorite,
  }) {
    isDone = isDone ?? false;
    isDelete = isDelete ?? false;
  }

  Task copyWith({
    String? title,
    String? description,
    String? id,
    String? date,
    bool? isDone,
    bool? isDelete,
    bool? isFavorite,
  }) {
    return Task(
      title: title ?? this.title,
      description: title ?? this.description,
       id: id ?? this.id,
       date: date ?? this.date,
      isDone: isDone ?? this.isDone,
      isDelete: isDelete ?? this.isDelete,
      isFavorite: isDelete ?? this.isFavorite,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'title': title});
    result.addAll({'description': description});
    result.addAll({'id': id});
    if (isDone != null) {
      result.addAll({'isDone': isDone});
    }
    if (isDelete != null) {
      result.addAll({'isDelete': isDelete});
    }

    return result;
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      id: map['id'] ?? '',
      date: map['date'] ?? '',
      isDone: map['isDone'],
      isDelete: map['isDelete'],
      isFavorite: map['isFavorite'],
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [
        title,
        description,
        id,
        date,
        isDone,
        isDelete,
        isFavorite,
      ];
}
