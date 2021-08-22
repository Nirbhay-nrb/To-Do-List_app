import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/constants.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/settings_card.dart';
import 'package:todoey_flutter/widgets/visible_bubble.dart';

import '../theme.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool dropDown = false;
  bool dropDown2 = false;

  @override
  void initState() {
    dropDown = false;
    dropDown2 = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<CustomTheme>(context).isTheme
          ? Colors.white
          : Color(0xFF424242),
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 30,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Provider.of<CustomTheme>(context).isTheme
            ? Colors.lightBlueAccent
            : Color(0xFF616161),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          top: 10,
          bottom: 10,
          left: 15,
          right: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                SettingsCard(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                          backgroundColor:
                              Provider.of<CustomTheme>(context).isTheme
                                  ? Colors.lightBlueAccent
                                  : Color(0xFF616161),
                          title: Center(
                            child: Text(
                              'Do you want to clear all tasks?',
                              style: TextStyle(
                                color: Provider.of<CustomTheme>(context).isTheme
                                    ? Colors.white
                                    : Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                            ),
                          ),
                          actionsPadding: EdgeInsets.symmetric(
                            horizontal: 32,
                          ),
                          actions: [
                            FlatButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                  elevation: 10,
                                  color:
                                      Provider.of<CustomTheme>(context).isTheme
                                          ? Color(0xFF29b6f6)
                                          : Color(0xFF9e9e9e),
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            FlatButton(
                              onPressed: () {
                                Provider.of<TaskData>(context, listen: false)
                                    .clear();
                                Navigator.pop(context);
                              },
                              child: Card(
                                elevation: 10,
                                color: Provider.of<CustomTheme>(context).isTheme
                                    ? Color(0xFF29b6f6)
                                    : Color(0xFF9e9e9e),
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Text(
                                    'Clear All',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  contentToDisplay: [
                    Icon(
                      Icons.clear_all_rounded,
                      color: Colors.white,
                    ),
                    Text(
                      'Clear All Tasks',
                      style: kSettingsTextStyle,
                    ),
                  ],
                ),
                SettingsCard(
                  onPressed: () {
                    Provider.of<CustomTheme>(context, listen: false)
                        .toggleTheme();
                  },
                  contentToDisplay: [
                    Icon(
                      Provider.of<CustomTheme>(context).isTheme
                          ? Icons.brightness_2
                          : Icons.brightness_5,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Text(
                        Provider.of<CustomTheme>(context).isTheme
                            ? 'Switch to dark mode'
                            : 'Switch to light mode',
                        textAlign: TextAlign.center,
                        style: kSettingsTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                SettingsCard(
                  onPressed: () {
                    setState(() {
                      dropDown = !dropDown;
                      dropDown2 = false;
                    });
                  },
                  contentToDisplay: [
                    Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Text(
                        'Deleting a particular task',
                        textAlign: TextAlign.center,
                        style: kSettingsTextStyle,
                      ),
                    ),
                  ],
                ),
                SettingsCard(
                  onPressed: () {
                    setState(() {
                      dropDown2 = !dropDown2;
                      dropDown = false;
                    });
                  },
                  contentToDisplay: [
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: Text(
                        'About The App',
                        textAlign: TextAlign.center,
                        style: kSettingsTextStyle,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            VisibleBubble(
              height: 120,
              isVisible: dropDown,
              widgetToDisplay: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.list,
                    color: Colors.white,
                  ),
                  Flexible(
                    child: Text(
                      'Long press on a task to delete it.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            VisibleBubble(
              isVisible: dropDown2,
              height: 200,
              widgetToDisplay: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Flexible(
                      child: Text(
                        'Todoey',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 40,
                            fontFamily: 'Lobster'),
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'A To-Do List App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'IndieFlower',
                      ),
                    ),
                  ),
                  Flexible(
                    child: Text(
                      'Created by - Nirbhay Makhija',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'IndieFlower',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
