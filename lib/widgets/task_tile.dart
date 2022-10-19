import 'package:bloc_task_fluuter/widgets/popup_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../Modules/task.dart';
import '../blocs/task_bloc/task_bloc.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.task,
  }) : super(key: key);

  final Task task;

   _removeOrDeleteTask(BuildContext ctx, Task task) {
    task.isDelete!
        ? ctx.read<TaskBloc>().add(
              DeleteTask(
                task: task,
              ),
            )
        : ctx.read<TaskBloc>().add(
              RemoveTask(task: task),
            );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                 task.isFavorite == false ? Icon(Icons.star_outline): Icon(Icons.star),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        task.title,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 17,
                            decoration: task.isDone!
                                ? TextDecoration.lineThrough
                                : null),
                      ),
                      Text(DateFormat('dd-MM-yyyy hh:mm')
                          .format(DateTime.parse(task.date))),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Checkbox(
                  value: task.isDone,
                  onChanged: task.isDelete == false
                      ? (value) {
                          context.read<TaskBloc>().add(
                                UpdateTask(task: task),
                              );
                        }
                      : null),
              PopUp(
                task: task,
                cancelOrDeleteCallback: _removeOrDeleteTask(context, task),
                likeOrDislike: context.read<TaskBloc>().add(MarkFavoriteOrUnfavoriteTask(task: task))),
        ],
      ),
     ],
    ),);
  }
}



// ListTile(
//       title: Text(
//         task.title,
//         overflow: TextOverflow.ellipsis,
//         style: TextStyle(
//             decoration: task.isDone! ? TextDecoration.lineThrough : null),
//       ),
//       trailing: Checkbox(
//           value: task.isDone,
//           onChanged: task.isDelete == false ? (value) {
//             context.read<TaskBloc>().add(
//                   UpdateTask(task: task),
//                 );
//           }: null),
//       onLongPress: () => _removeOrDeleteTask(context, task),
//     );