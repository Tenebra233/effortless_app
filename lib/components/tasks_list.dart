import 'package:flutter/material.dart';
import 'package:todoey_flutter/components/tasks_tile.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TasksList extends StatelessWidget {
  //Costruisce una lista che renderizza molti elementi (o infiniti) e ottimizza le prestazioni
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(builder: (context, taskData, child) {
      return ListView.builder(
        itemBuilder: (context, index) {
          final task = taskData.tasks[index];
          return TaskTile(
            taskTitle: task.name,
            isChecked: task.isDone,
            checkboxCallback: (bool checkboxState) {
              taskData.updateTask(task);
            },
            onDismissed: (direction) {
              taskData.deleteTask(task);
            },
            key: Key(taskData.taskCount.toString()),
            hour: task.hour,
            minute: task.minute,
          );
        },
        //Numero delle task uguali a quelle aggiunge nella lista (dinamico)
        itemCount: taskData.taskCount,
      );
    });
  }
}
