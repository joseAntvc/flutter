import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/screens/dashboard_screen.dart';
import 'package:pmsn2025/screens/login_screen.dart';
import 'package:pmsn2025/utils/sesion_values.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<bool>(//Es para poder construir la pantalla por la sesion
        future: isSesionActiva(),//Es un metodo que esta en el archivo sesion_values.dart
        builder: (context, snapshot) {
          bool isUserLoggedIn = snapshot.data ?? false;
          return Center(
            child: FlutterSplashScreen(
              duration: const Duration(milliseconds: 4500),
              backgroundColor: Colors.white,
              nextScreen: isUserLoggedIn ? DashboardScreen() : LoginScreen(),
              splashScreenBody: Center(
                child: Lottie.asset("assets/Tecnm.json"),
              ),
            ),
          );
        },
      ),
    );
  }
}