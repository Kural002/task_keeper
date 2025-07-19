import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/task_model.dart';
import '../viewmodels/task_viewmodel.dart';

class TaskTile extends StatelessWidget {
  final int index;
  final Task task;

  const TaskTile({required this.index, required this.task});

  @override
  Widget build(BuildContext context) {
    final taskVM = Provider.of<TaskViewModel>(context, listen: false);

    return ListTile(
      title: Text(
        task.title,
        style: TextStyle(
          decoration: task.isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      leading: Checkbox(
        value: task.isDone,
        onChanged: (_) => taskVM.toggleTask(index),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => taskVM.deleteTask(index),
      ),
    );
  }
}
