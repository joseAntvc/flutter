import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/dashboard_screen.dart';
import 'package:pmsn2025/screens/list_students_screen.dart';
import 'package:pmsn2025/screens/splash_screen.dart';
import 'package:pmsn2025/travel/screens/detail_place_screen.dart';
import 'package:pmsn2025/travel/screens/home_screen.dart';
import 'package:pmsn2025/travel/screens/loginT_screen.dart';
import 'package:pmsn2025/utils/global_values.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.themeApp,
      builder: (context, value, child) {
        return MaterialApp(
          theme: value,
          routes: {
            "/list": (context) => const ListStudentsScreen(),  
            "/dash": (context) => const DashboardScreen(),
            "/home": (context) => const HomeScreen(),
            "/leading": (context) => const LoginTScreen(),
            "/detail_place": (context) => const DetailPlaceScreen()
          },
          title: 'Material App',
          home: SplashScreen()
        );
      }
    );
  }
}