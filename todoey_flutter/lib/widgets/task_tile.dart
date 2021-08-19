import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/theme.dart';

class TaskTile extends StatelessWidget {
  final bool isChecked;
  final String taskTitle;
  final Function checkboxCallBack;
  final Function longPressCallBack;
  TaskTile(
      {this.isChecked,
      this.taskTitle,
      this.checkboxCallBack,
      this.longPressCallBack});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: longPressCallBack,
      title: Text(
        taskTitle,
        style: TextStyle(
          fontSize: 18,
          color: Theme.of(context).primaryColor,
          decoration: isChecked ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        value: isChecked,
        activeColor: Provider.of<CustomTheme>(context).isTheme
            ? Colors.lightBlueAccent
            : Colors.white,
        checkColor: Provider.of<CustomTheme>(context).isTheme
            ? Colors.white
            : Colors.black,
        onChanged: checkboxCallBack,
      ),
    );
  }
}
