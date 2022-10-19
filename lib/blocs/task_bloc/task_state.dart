part of 'task_bloc.dart';

class TaskState extends Equatable {
  final List<Task> allTasks;
  final List<Task> removeTasks;
  const TaskState({
    this.allTasks = const <Task>[],
    this.removeTasks = const <Task>[],
  });

  @override
  List<Object> get props => [allTasks, removeTasks];

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({
      'allTasks': allTasks.map((x) => x.toMap()).toList(),
      'removeTasks': removeTasks.map((x) => x.toMap()).toList()
    });

    return result;
  }

  factory TaskState.fromMap(Map<String, dynamic> map) {
    return TaskState(
      allTasks: List<Task>.from(map['allTasks']?.map((x) => Task.fromMap(x))),
      removeTasks:
          List<Task>.from(map['removeTasks']?.map((x) => Task.fromMap(x))),
    );
  }
}
