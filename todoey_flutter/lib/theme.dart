import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomTheme extends ChangeNotifier {
  bool isTheme = true;

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.black,
      scaffoldBackgroundColor: Colors.lightBlueAccent,
      accentColor: Colors.white,
      iconTheme: IconThemeData(color: Colors.lightBlueAccent),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 8,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.lightBlueAccent,
          fontSize: 30,
        ),
        bodyText2: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.white,
      scaffoldBackgroundColor: Color(0xFF424242),
      accentColor: Color(0xFF616161),
      iconTheme: IconThemeData(color: Colors.black),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.black54,
        elevation: 8,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        bodyText2: TextStyle(color: Colors.white, fontSize: 20),
      ),
    );
  }

  void toggleTheme() {
    isTheme = !isTheme;
    setIsTheme();
    notifyListeners();
  }

  void getIsTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    isTheme = preferences.getBool("isTheme") ?? true;
    notifyListeners();
  }

  void setIsTheme() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setBool("isTheme", isTheme);
  }
}
