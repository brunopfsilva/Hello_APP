import 'package:flutter/material.dart';

class CustomTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      fontFamily: 'OpenSans',
      brightness: Brightness.light,
      primaryColor: Colors.blue,
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      fontFamily: 'OpenSans',
      brightness: Brightness.dark,
      scaffoldBackgroundColor: Color(0xff101622),
      primaryColor: Colors.cyan,
      accentColor: Colors.cyan,
      dividerColor: Colors.cyan,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide(
            color: Colors.cyan,
          ),
        ),
      ),
      appBarTheme: AppBarTheme(
        color: Colors.transparent,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.white),
        textTheme: TextTheme(
          headline6: TextStyle(
            color: Colors.white,
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}
