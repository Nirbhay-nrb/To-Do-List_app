import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';
import 'package:todoey_flutter/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: TaskData()),
        ChangeNotifierProvider.value(value: CustomTheme()),
      ],
      child: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void initState() {
    super.initState();
    Provider.of<CustomTheme>(context, listen: false).getIsTheme();
    Provider.of<TaskData>(context, listen: false).getList();
    // clear();
  }

  void clear() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.clear();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Provider.of<CustomTheme>(context).isTheme
          ? CustomTheme.lightTheme
          : CustomTheme.darkTheme,
      home: TasksScreen(),
    );
  }
}
