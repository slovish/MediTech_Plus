import 'package:flutter/material.dart';

class Mytheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(color: Colors.black, fontSize: 20),
        ),
      );
  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
      );
}
