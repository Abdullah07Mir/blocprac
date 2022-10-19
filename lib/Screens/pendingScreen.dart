import 'package:bloc_task_fluuter/Modules/task.dart';
import 'package:bloc_task_fluuter/Screens/add_taskScreen.dart';
import 'package:bloc_task_fluuter/Screens/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../blocs/task_bloc/task_bloc.dart';
import '../widgets/tasks_list.dart';

// ignore: use_key_in_widget_constructors
class PendingTaskScreen extends StatelessWidget {
  static const id = 'tasks_screen';


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TaskBloc, TaskState>(
      builder: (context, state) {
        List<Task> tasksList = state.allTasks;
        return Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Chip(
                  label: Text('${state.allTasks.length} Tasks'),
                ),
              ),
              TasksList(tasksList: tasksList),
            ],
        );
      },
    );
  }
}
