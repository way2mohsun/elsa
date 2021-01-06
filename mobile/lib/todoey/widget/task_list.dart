import 'package:flutter/material.dart';
import 'package:flutterapp/todoey/modules/task.dart';
import 'package:flutterapp/todoey/modules/task_list.dart';
import 'package:flutterapp/todoey/widget/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Task> tasks = context.watch<TaskList>().tasks;
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: tasks.length,
      itemBuilder: (BuildContext context, int index) {
        return TaskTile(
          title: tasks[index].name,
          isChecked: tasks[index].done,
          checkBoxCallBack: (checkBoxState) {
            context.read<TaskList>().toggleDone(index: index);
          },
        );
      },
    );
  }
}
