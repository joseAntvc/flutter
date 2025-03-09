import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/sesion_values.dart';

class ThemeTileView extends StatelessWidget {
  const ThemeTileView({super.key, required this.icon ,required this.themeTitle, required this.themeName, required this.selectedTheme, required this.themeData});

  final IconData icon;
  final String themeTitle;
  final String themeName;
  final ThemeData selectedTheme;
  final ThemeData themeData;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(themeTitle),
      iconColor: selectedTheme == themeData ?  Colors.white : null,
      textColor: selectedTheme == themeData ?  Colors.white : null,
      tileColor: selectedTheme == themeData ? Colors.blue[300] : null, // Resaltar el tema activo
      onTap: selectedTheme == themeData ? null : () {
        GlobalValues.themeApp.value = themeData;
        saveTheme(themeName);
      },
    );
  }
}