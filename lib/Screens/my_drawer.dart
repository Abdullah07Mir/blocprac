import 'package:bloc_task_fluuter/Screens/recycle-bin.dart';
import 'package:bloc_task_fluuter/Screens/taskScreen.dart';
import 'package:bloc_task_fluuter/blocs/block_export.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/task_bloc/task_bloc.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
          child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
            color: Colors.grey,
            child: Text(
              'Task Drawer',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(TaskScreen.id),
                child: ListTile(
                  leading: Icon(Icons.folder_special),
                  title: Text('My Task'),
                  trailing: Text('${state.allTasks.length}'),
                ),
              );
            },
          ),
          Divider(),
          BlocBuilder<TaskBloc, TaskState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushReplacementNamed(RecycleBin.id),
                child: ListTile(
                  leading: Icon(Icons.delete),
                  title: Text('Bin'),
                  trailing: Text('${state.removeTasks.length}'),
                ),
              );
            },
          ),
          BlocBuilder<SwitchBlocBloc, SwitchBlocState>(
            builder: (context, state) {
              return Switch(
                  value: state.switchValue,
                  onChanged: (newValue) {
                    newValue
                        ? context.read<SwitchBlocBloc>().add(
                              SwitchOnEvent(),
                            )
                        : context.read<SwitchBlocBloc>().add(
                              SwitchOffEvent(),
                            );
                  });
            },
          )
        ],
      )),
    );
  }
}
