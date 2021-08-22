import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class SettingsCard extends StatelessWidget {
  final Function onPressed;
  final List<Widget> contentToDisplay;
  SettingsCard({@required this.onPressed, @required this.contentToDisplay});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 120,
        child: FlatButton(
          padding: EdgeInsets.all(0),
          onPressed: onPressed,
          child: Card(
            color: Provider.of<CustomTheme>(context).isTheme
                ? Colors.lightBlueAccent
                : Color(0xFF606060),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(
                  10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: contentToDisplay,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
