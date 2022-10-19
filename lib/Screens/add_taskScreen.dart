import 'dart:math';

import 'package:bloc_task_fluuter/serveces/guid_gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../Modules/task.dart';
import '../blocs/task_bloc/task_bloc.dart';

class AddTaskScreen extends StatelessWidget {
  AddTaskScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController titleController = TextEditingController();
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          SizedBox(
            height: 10,
          ),
          TextField(
            autofocus: true,
            controller: titleController,
            decoration: InputDecoration(
              label: Text('Title'),
              border: OutlineInputBorder(),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: () {
                  var task = Task(
                      title: titleController.text,
                      id: GuidGen().getRandomString(5));
                  context.read<TaskBloc>().add(
                        AddTask(task: task),
                      );
                  Navigator.pop(context);
                },
                child: Text('Add'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
