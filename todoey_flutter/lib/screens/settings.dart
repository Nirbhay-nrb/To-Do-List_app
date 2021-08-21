import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sliding_switch/sliding_switch.dart';
import 'package:todoey_flutter/models/task_data.dart';

import '../theme.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool dropDown = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<CustomTheme>(context).isTheme
          ? Color(0xFFb2ebf2)
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
          left: 20,
          right: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                vertical: 2,
              ),
              color: Provider.of<CustomTheme>(context).isTheme
                  ? Color(0xFFb2ebf2)
                  : Color(0xFF424242),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Clear Tasks'),
                  MaterialButton(
                    onPressed: () {
                      Provider.of<TaskData>(context, listen: false).clear();
                    },
                    child: Text(
                      'Clear',
                      style: TextStyle(
                        color: Provider.of<CustomTheme>(context).isTheme
                            ? Colors.black
                            : Colors.white,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              height: 2,
              color: Provider.of<CustomTheme>(context).isTheme
                  ? Colors.black54
                  : Colors.white,
            ),
            Container(
              height: 50,
              padding: EdgeInsets.symmetric(
                vertical: 2,
              ),
              color: Provider.of<CustomTheme>(context).isTheme
                  ? Color(0xFFb2ebf2)
                  : Color(0xFF424242),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Theme: '),
                  SlidingSwitch(
                    value: Provider.of<CustomTheme>(context).isTheme,
                    width: 50,
                    onChanged: (bool value) {
                      print(value);
                      Provider.of<CustomTheme>(context, listen: false)
                          .toggleTheme();
                      print(Provider.of<CustomTheme>(context, listen: false)
                          .isTheme);
                    },
                    height: 25,
                    animationDuration: const Duration(milliseconds: 100),
                    onTap: () {},
                    onDoubleTap: () {},
                    onSwipe: () {},
                    textOff: "N",
                    textOn: "Y",
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
            Divider(
              height: 2,
              color: Provider.of<CustomTheme>(context).isTheme
                  ? Colors.black54
                  : Colors.white,
            ),
            Flexible(
              child: Container(
                height: 50,
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                ),
                color: Provider.of<CustomTheme>(context).isTheme
                    ? Color(0xFFb2ebf2)
                    : Color(0xFF424242),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Deleting a particular task',
                        ),
                        MaterialButton(
                          onPressed: () {
                            setState(() {
                              dropDown = !dropDown;
                            });
                          },
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Provider.of<CustomTheme>(context).isTheme
                                ? Colors.black
                                : Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Visibility(
                      child: Text('Long press on a task to delete it.'),
                      visible: dropDown,
                    ),
                  ],
                ),
              ),
            ),
            Text('ssdgsgsgsg'),
          ],
        ),
      ),
    );
  }
}
