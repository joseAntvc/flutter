// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/theme_settings.dart';
import 'package:shared_preferences/shared_preferences.dart';

// Función para activar la sesión del usuario
Future<void> activarSesion() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setBool("user_sesion", true);
}

// Función para desactivar la sesión del usuario (Cerrar sesión)
Future<void> desactivarSesion() async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove("user_sesion");
}

//Para checar la sesion
Future<bool> isSesionActiva() async {
  final prefs = await SharedPreferences.getInstance();
  return prefs.getBool("user_sesion") ?? false; // Si no existe, devuelve false
}

// Temas disponibles
final Map<String, ThemeData> themes = {
  'light': ThemeData.light(),
  'dark': ThemeData.dark(),
  'custom': ThemeSettings.custom(), 
};

//Funcion para guardar el tema
Future<void> saveTheme(String themeName) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('themeName', themeName);
}

//Funcion para guardar el tema de fuente
Future<void> saveFont(String themeFont) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setString('themeFont', themeFont);
}

//Funcion para cargar el tema
Future<void> loadTheme() async {
  final prefs = await SharedPreferences.getInstance();
  final themeName = prefs.getString('themeName');
  final themeFont = prefs.getString('themeFont');
  GlobalValues.themeApp.value = themes[themeName] ?? ThemeData.light();
  GlobalValues.fontApp.value = themeFont ?? 'Roboto';
}

// Función para guardar los colores del personalizado
Future<void> saveCustomColors(Color primary, Color surface, Color onSurface, Color appBarBackground, Color appBarForeground) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt('customPrimary', primary.value);
  await prefs.setInt('customSurface', surface.value);
  await prefs.setInt('customOnSurface', onSurface.value);
  await prefs.setInt('customAppBarBackground', appBarBackground.value);
  await prefs.setInt('customAppBarForeground', appBarForeground.value);
}

// Función para cargar los colores del personalizado
Future<Map<String, Color>> loadCustomColors() async {
  final prefs = await SharedPreferences.getInstance();
  final primary = Color(prefs.getInt('customPrimary') ?? Colors.blue.value);
  final surface = Color(prefs.getInt('customSurface') ?? Colors.white.value);
  final onSurface = Color(prefs.getInt('customOnSurface') ?? Colors.black.value);
  final appBarBackground = Color(prefs.getInt('customAppBarBackground') ?? Colors.blue.value);
  final appBarForeground = Color(prefs.getInt('customAppBarForeground') ?? Colors.white.value);
  ThemeSettings.updateCustomTheme(primary, surface, onSurface, appBarBackground, appBarForeground);
  return {
    'Botones': primary,
    'Ventanas': surface,
    'Texto': onSurface,
    'Barra principal': appBarBackground,
    'Texto de la barra': appBarForeground,
  };
}


