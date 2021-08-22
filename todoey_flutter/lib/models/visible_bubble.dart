import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../theme.dart';

class VisibleBubble extends StatelessWidget {
  final bool isVisible;
  final double height;
  final Widget widgetToDisplay;
  VisibleBubble({this.height, this.isVisible, this.widgetToDisplay});

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        height: height,
        child: Card(
          color: Provider.of<CustomTheme>(context).isTheme
              ? Colors.lightBlueAccent
              : Color(0xFF606060),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: widgetToDisplay,
          ),
        ),
      ),
    );
  }
}
