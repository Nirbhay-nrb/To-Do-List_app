import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';

import '../theme.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Provider.of<CustomTheme>(context).isTheme
          ? Color(0xFF757575)
          : Color(0xFF2E2E2E),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 30,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (value) {
                newTaskTitle = value;
              },
              style: TextStyle(
                color: Provider.of<CustomTheme>(context).isTheme
                    ? Colors.black
                    : Colors.white,
              ),
              onSubmitted: (value) {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Provider.of<TaskData>(context, listen: false).setList();

                Navigator.pop(context);
              },
            ),
            SizedBox(
              height: 15,
            ),
            FlatButton(
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  'Add',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
              onPressed: () {
                Provider.of<TaskData>(context, listen: false)
                    .addTask(newTaskTitle);
                Provider.of<TaskData>(context, listen: false).setList();

                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
