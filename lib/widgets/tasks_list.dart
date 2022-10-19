import 'package:bloc_task_fluuter/widgets/task_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Modules/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasksList,
  }) : super(key: key);

  final List<Task> tasksList;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList.radio(
      children: tasksList
          .map(
            (task) => ExpansionPanelRadio(
              value: task,
              headerBuilder: (context, isOpen) => TaskTile(task: task),
              body: SelectableText.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'text',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                    ),
                    TextSpan(text:task.title),
                    TextSpan(
                      text: 'description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                    ),
                    TextSpan(text:task.description),
                  ],
                ),
                
              ),
            ),
          )
          .toList(),
    );
  }
}


// return Expanded(
    //   child: ListView.builder(
    //     itemCount: tasksList.length,
    //     itemBuilder: ((context, index) {
    //       var task = tasksList[index];
    //       return TaskTile(task: task);
    //     }),
    //   ),
    // );