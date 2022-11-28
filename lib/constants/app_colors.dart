import 'package:flutter/material.dart';

const black = Color(0xFF101823);
const black_second = Color.fromARGB(255, 237, 237, 237);
const white = Color.fromARGB(255, 255, 255, 255);
const grey = Color(0xFF787878);

class AppTheme {
  final valoTheme = ThemeData(
    scaffoldBackgroundColor: black_second,
    appBarTheme:
        const AppBarTheme(backgroundColor: Colors.transparent, elevation: 0),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: black),
  );
}
