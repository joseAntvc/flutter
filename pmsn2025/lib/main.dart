import 'package:flutter/material.dart';
import 'package:pmsn2025/screens/dashboard_screen.dart';
import 'package:pmsn2025/screens/list_students_screen.dart';
import 'package:pmsn2025/screens/login_screen.dart';
import 'package:pmsn2025/screens/register_screen.dart';
import 'package:pmsn2025/screens/splash_screen.dart';
import 'package:pmsn2025/screens/todo_screen.dart';
import 'package:pmsn2025/travel/screens/detail_place_screen.dart';
import 'package:pmsn2025/travel/screens/home_screen.dart';
import 'package:pmsn2025/travel/screens/loginT_screen.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/sesion_values.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await loadTheme();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.themeApp,
      builder: (context, themeV, child) {
        return ValueListenableBuilder(
          valueListenable: GlobalValues.fontApp,
          builder: (context, fontV, child) {
            return MaterialApp(
              theme: themeV.copyWith(
                textTheme: themeV.textTheme.apply(
                  fontFamily: fontV,
                ),
              ),
              routes: {
                "/list": (context) => const ListStudentsScreen(),  
                "/dash": (context) => const DashboardScreen(),
                "/home": (context) => const HomeScreen(),
                "/leading": (context) => const LoginTScreen(),
                "/detail_place": (context) => const DetailPlaceScreen(),
                "/todo" : (context) => const TodoScreen(),
                "/register": (context) => const RegisterScreen(),
                "/login": (context) => const LoginScreen()
              },
              title: 'Material App',
              home: SplashScreen()
            );
          }
        );
      }
    );
  }
}