import 'package:flutter/material.dart';

class ThemeSettings {
  
  static ThemeData lightTheme(){
    final theme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.red,
        onPrimary: Colors.amber,
        error: Colors.grey,
        onError: Colors.orange,
        secondary: Colors.green, 
        onSecondary: Colors.blue, 
        surface: Colors.black, 
        onSurface: Colors.purple,
      ),
    );
    return theme;
  }

  static ThemeData darkTheme(){
    final theme = ThemeData.dark().copyWith(
      colorScheme: ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.red,
        onPrimary: Colors.amber,
        error: Colors.grey,
        onError: Colors.orange,
        secondary: Colors.green, 
        onSecondary: Colors.blue, 
        surface: Colors.black, 
        onSurface: Colors.purple,
      ),
    );
    return theme;
  }
}