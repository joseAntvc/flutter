import 'package:flutter/material.dart';

class ThemeSettings {
  
  static ThemeData lightTheme(){
    final theme = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: Colors.red,
        onPrimary: const Color.fromARGB(255, 204, 196, 172),
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

  static ThemeData customPlantilla = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: ColorScheme(
      brightness: Brightness.light, // Tema ligth
      primary: Colors.red, // !!! La parte del avatar y botones
      onPrimary: Colors.green, // !!! Icono dentro de boton
      error: Colors.red, //No se bien toda bien
      onError: Colors.red, //Es el encabezado
      secondary: Colors.green, //No se
      onSecondary: Colors.blue, //No se
      surface: Colors.brown, // !!! Fondo de la pantalla de los drawer y modals
      onSurface: Colors.blue, // !!! Texto de la aplicacion
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.orange, //El fondo de appBar
      foregroundColor: Colors.white, //El texto de appBar
    ),
  );

  static ThemeData custom() {
    return customPlantilla;
  }

  static void updateCustomTheme(Color primary, Color surface, Color onSurface, Color appBarBackground, Color appBarForeground) {
    customPlantilla = ThemeData.light().copyWith(
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme(
        brightness: Brightness.light, // Tema ligth
        primary: primary, // !!! La parte del avatar y botones
        onPrimary: Colors.green, // !!! Icono dentro de boton
        error: Colors.red, //No se bien toda bien
        onError: Colors.red, //Es el encabezado
        secondary: Colors.green, //No se
        onSecondary: Colors.blue, //No se
        surface: surface, // !!! Fondo de la pantalla de los drawer y modals
        onSurface: onSurface, // !!! Texto de la aplicacion
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: appBarBackground, //El fondo de appBar
        foregroundColor: appBarForeground, //El texto de appBar
      ),
    );
  }
}
