// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:bloc_task_fluuter/Screens/favoriteScreen.dart';
import 'package:equatable/equatable.dart';

import '../../Modules/task.dart';
import '../block_export.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends HydratedBloc<TaskEvent, TaskState> {
  TaskBloc() : super(const TaskState()) {
    on<AddTask>(_onAddTask);
    on<UpdateTask>(_onUpdateTask);
    on<DeleteTask>(_onDeleteTask);
    on<RemoveTask>(_onRemoveTask);
    on<MarkFavoriteOrUnfavoriteTask>(_onMarkFavoriteOrUnfavoriteTask);
  }

  void _onAddTask(AddTask event, Emitter<TaskState> emit) {
    final state = this.state;

    emit(TaskState(
      pendingTasks: List.from(state.pendingTasks)..add(event.task),
      completeTasks: state.completeTasks,
      favoriteTasks: state.favoriteTasks,
      removeTasks: state.removeTasks,
    ));
  }

  void _onUpdateTask(UpdateTask event, Emitter<TaskState> emit) {
    final state = this.state;
    final task = event.task;
    List<Task> pendingTasks = state.pendingTasks ;
     List<Task> completeTasks = state.completeTasks ;
    task.isDone == false
        ? {
          pendingTasks = List.from(pendingTasks)..remove(task),
          completeTasks = List.from(completeTasks)..insert(0, task.copyWith(isDone: true))
        }
        : {
          completeTasks = List.from(completeTasks)..remove(task),
          pendingTasks = List.from(pendingTasks)..insert(0, task.copyWith(isDone: true),),
        };
    emit(
      TaskState(pendingTasks: pendingTasks,completeTasks: completeTasks, favoriteTasks: state.favoriteTasks, removeTasks: state.removeTasks),
    );
  }

  void _onDeleteTask(DeleteTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        pendingTasks: state.pendingTasks,
        completeTasks: state.completeTasks,
        favoriteTasks: state.favoriteTasks,
        removeTasks: List.from(state.removeTasks)..remove(event.task),
      ),
    );
  }

  void _onRemoveTask(RemoveTask event, Emitter<TaskState> emit) {
    final state = this.state;
    emit(
      TaskState(
        pendingTasks: List.from(state.pendingTasks)..remove(event.task),
        completeTasks: List.from(state.completeTasks)..remove(event.task),
        favoriteTasks: List.from(state.favoriteTasks)..remove(event.task),
        removeTasks: List.from(state.removeTasks)
          ..add(
            event.task.copyWith(isDelete: true),
          ),
      ),
    );
  }

  void _onMarkFavoriteOrUnfavoriteTask(MarkFavoriteOrUnfavoriteTask event, Emitter<TaskState> emit){
    final state = this.state;
    List<Task> pendingTasks = state.pendingTasks;
    List<Task> completedTasks = state.completeTasks;
    List<Task> favoriteTasks = state.favoriteTasks;
    if(event.task.isDone == false){
      if(event.task.isFavorite == false){
        var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)..remove(event.task)..insert(taskIndex, event.task.copyWith(isFavorite: true),);
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      }
      else{
         var taskIndex = pendingTasks.indexOf(event.task);
        pendingTasks = List.from(pendingTasks)..remove(event.task)..insert(taskIndex, event.task.copyWith(isFavorite: true),);
        favoriteTasks.remove(event.task);
      }
    }
    else{
       if(event.task.isFavorite == false){
        var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)..remove(event.task)..insert(taskIndex, event.task.copyWith(isFavorite: true),);
        favoriteTasks.insert(0, event.task.copyWith(isFavorite: true));
      }
      else{
         var taskIndex = completedTasks.indexOf(event.task);
        completedTasks = List.from(completedTasks)..remove(event.task)..insert(taskIndex, event.task.copyWith(isFavorite: true),);
        favoriteTasks.remove(event.task);
      }
    }
    emit(TaskState(
      pendingTasks: pendingTasks,
      completeTasks: completedTasks,
      favoriteTasks: favoriteTasks,
      removeTasks: state.removeTasks,
    ));
  }

  @override
  TaskState? fromJson(Map<String, dynamic> json) {
    return TaskState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TaskState state) {
    return state.toMap();
  }
}
