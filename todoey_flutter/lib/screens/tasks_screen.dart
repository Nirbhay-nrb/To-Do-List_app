import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/theme.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';

class TasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) => SingleChildScrollView(
              child: Container(
                child: AddTaskScreen(),
              ),
            ),
          );
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              top: 60,
              left: 30,
              right: 30,
              bottom: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30,
                  child: IconTheme(
                    data: Theme.of(context).iconTheme,
                    child: Icon(
                      Icons.list,
                      size: 30,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${Provider.of<TaskData>(context).taskCount} Tasks',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SlidingSwitch(
                  value: false,
                  width: 125,
                  onChanged: (bool value) {
                    Provider.of<CustomTheme>(context, listen: false)
                        .toggleTheme();
                  },
                  height: 25,
                  animationDuration: const Duration(milliseconds: 100),
                  onTap: () {},
                  onDoubleTap: () {},
                  onSwipe: () {},
                  textOff: "Light",
                  textOn: "Dark",
                  colorOn: Provider.of<CustomTheme>(context).isTheme
                      ? Colors.lightBlueAccent
                      : Colors.white,
                  colorOff: Provider.of<CustomTheme>(context).isTheme
                      ? Color(0xff6682c0)
                      : Color(0xffbdbdbd),
                  background: Provider.of<CustomTheme>(context).isTheme
                      ? Color(0xffe4e5eb)
                      : Color(0xff9e9e9e),
                  buttonColor: Provider.of<CustomTheme>(context).isTheme
                      ? Color(0xfff7f5f7)
                      : Color(0xff757575),
                  inactiveColor: Provider.of<CustomTheme>(context).isTheme
                      ? Color(0xff636f7b)
                      : Color(0xff636f7b),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}
