import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              taskTitle: taskData.tasks[index].name,
              isChecked: taskData.tasks[index].isDone,
              checkboxCallBack: (checkBoxState) {
                taskData.updateTask(taskData.tasks[index]);
                Provider.of<TaskData>(context, listen: false).setIsChecked();
              },
              longPressCallBack: () async {
                taskData.deleteTask(taskData.tasks[index]);
                SharedPreferences preferences =
                    await SharedPreferences.getInstance();

                int count = preferences.getInt('length');
                for (int i = index; i < count; i++) {
                  bool temp = preferences.getBool('tasks${i + 1}') ?? false;
                  preferences.setBool('tasks$i', temp);
                  String temp1 = preferences.getString('task${i + 1}') ?? ' ';
                  preferences.setString('task$i', temp1);
                }
                preferences.remove('task$count');
                preferences.remove('tasks$count');

                count--;
                preferences.setInt('length', count);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
