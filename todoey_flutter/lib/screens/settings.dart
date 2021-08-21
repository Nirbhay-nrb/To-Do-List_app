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
  bool dropDown2 = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<CustomTheme>(context).isTheme
          ? Color(0xFFbbdefb)
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
            Expanded(
              child: Container(
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Provider.of<TaskData>(context, listen: false).clear();
                  },
                  child: Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Clear Tasks',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                            // MaterialButton(
                            //   color: Colors.lightBlueAccent,
                            //   onPressed: () {
                            //     Provider.of<TaskData>(context, listen: false)
                            //         .clear();
                            //   },
                            //   child: Text(
                            //     'Clear',
                            //     style: TextStyle(
                            //       color: Provider.of<CustomTheme>(context).isTheme
                            //           ? Colors.black
                            //           : Colors.white,
                            //       fontSize: 18,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    Provider.of<CustomTheme>(context, listen: false)
                        .toggleTheme();
                  },
                  child: Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Provider.of<CustomTheme>(context).isTheme
                                ? 'Tap for dark mode'
                                : 'Tap for light mode',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          // SizedBox(
                          //   height: 10,
                          // ),
                          // SlidingSwitch(
                          //   value: Provider.of<CustomTheme>(context).isTheme,
                          //   width: 50,
                          //   onChanged: (bool value) {
                          //     print(value);
                          //     Provider.of<CustomTheme>(context, listen: false)
                          //         .toggleTheme();
                          //     print(
                          //         Provider.of<CustomTheme>(context, listen: false)
                          //             .isTheme);
                          //   },
                          //   height: 25,
                          //   animationDuration: const Duration(milliseconds: 100),
                          //   onTap: () {},
                          //   onDoubleTap: () {},
                          //   onSwipe: () {},
                          //   textOff: "N",
                          //   textOn: "Y",
                          //   colorOn: Provider.of<CustomTheme>(context).isTheme
                          //       ? Colors.lightBlueAccent
                          //       : Colors.white,
                          //   colorOff: Provider.of<CustomTheme>(context).isTheme
                          //       ? Color(0xff6682c0)
                          //       : Color(0xffbdbdbd),
                          //   background: Provider.of<CustomTheme>(context).isTheme
                          //       ? Color(0xffe4e5eb)
                          //       : Color(0xff9e9e9e),
                          //   buttonColor: Provider.of<CustomTheme>(context).isTheme
                          //       ? Color(0xfff7f5f7)
                          //       : Color(0xff757575),
                          //   inactiveColor:
                          //       Provider.of<CustomTheme>(context).isTheme
                          //           ? Color(0xff636f7b)
                          //           : Color(0xff636f7b),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: FlatButton(
                  padding: EdgeInsets.all(0),
                  onPressed: () {
                    setState(() {
                      dropDown = !dropDown;
                      dropDown2 = !dropDown2;
                    });
                  },
                  child: Card(
                    color: Colors.lightBlueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Visibility(
                            visible: dropDown2,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Deleting a particular task',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                // MaterialButton(
                                //   onPressed: () {
                                //     setState(() {
                                //       dropDown = true;
                                //       dropDown2 = false;
                                //     });
                                //   },
                                //   materialTapTargetSize:
                                //       MaterialTapTargetSize.shrinkWrap,
                                //   child: Icon(
                                //     Icons.keyboard_arrow_down,
                                //     color: Provider.of<CustomTheme>(context)
                                //             .isTheme
                                //         ? Colors.black
                                //         : Colors.white,
                                //   ),
                                // ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Visibility(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    'Long press on a task to delete it.',
                                    style: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                // MaterialButton(
                                //   onPressed: () {
                                //     setState(() {
                                //       dropDown = false;
                                //       dropDown2 = true;
                                //     });
                                //   },
                                //   materialTapTargetSize:
                                //       MaterialTapTargetSize.shrinkWrap,
                                //   child: Icon(
                                //     Icons.keyboard_arrow_left,
                                //     color: Provider.of<CustomTheme>(context)
                                //             .isTheme
                                //         ? Colors.black
                                //         : Colors.white,
                                //   ),
                                // ),
                              ],
                            ),
                            visible: dropDown,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Card(
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Clear Tasks',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        MaterialButton(
                          color: Colors.lightBlueAccent,
                          onPressed: () {
                            Provider.of<TaskData>(context, listen: false)
                                .clear();
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
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Card(
                  color: Colors.lightBlueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Clear Tasks',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        MaterialButton(
                          color: Colors.lightBlueAccent,
                          onPressed: () {
                            Provider.of<TaskData>(context, listen: false)
                                .clear();
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
/*

            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                ),
                color: Provider.of<CustomTheme>(context).isTheme
                    ? Colors.lightBlueAccent
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
            ),
            Divider(
              height: 2,
              color: Provider.of<CustomTheme>(context).isTheme
                  ? Colors.black54
                  : Colors.white,
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                ),
                color: Provider.of<CustomTheme>(context).isTheme
                    ? Colors.lightBlueAccent
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
            ),
            Divider(
              height: 2,
              color: Provider.of<CustomTheme>(context).isTheme
                  ? Colors.black54
                  : Colors.white,
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                ),
                color: Provider.of<CustomTheme>(context).isTheme
                    ? Colors.lightBlueAccent
                    : Color(0xFF424242),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                      child: Text(
                        'Long press on a task to delete it.',
                        textAlign: TextAlign.start,
                      ),
                      visible: dropDown,
                    ),
                  ],
                ),
              ),
            ),
            Divider(
              height: 2,
              color: Provider.of<CustomTheme>(context).isTheme
                  ? Colors.black54
                  : Colors.white,
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 2,
                ),
                color: Provider.of<CustomTheme>(context).isTheme
                    ? Colors.lightBlueAccent
                    : Color(0xFF424242),
                child: Text('Thanks!!'),
              ),
            ),

*/
