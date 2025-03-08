import 'dart:io';
import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/sesion_values.dart';
import 'package:pmsn2025/views/theme_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  String? userName;
  String? userEmail;
  String? userPhoto;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>(); //Es una variable que permite acceder a los estados de un widget padre

  @override
  void initState() {
    super.initState();
    loadUserData();
  }

  Future<void> loadUserData() async {
    final prefs = await SharedPreferences.getInstance();
    userName = prefs.getString("user_name");
    userEmail = prefs.getString("user_email");
    userPhoto = prefs.getString("user_photo");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Center(child: Text("Bienvenidos")),
      actions: [
        IconButton(
          splashColor: Colors.transparent,
          icon: Icon(Icons.palette_rounded), // Para poder cambiar el icono
          onPressed: () {
            _scaffoldKey.currentState?.openEndDrawer(); //Ocupaba esto porque sino marcaba error porque no estaba inicializado el scaffold
          },
        ),
      ],
      /*actions: [
        DarlightButton(
          type: Darlights.DarlightFour,
          options: DarlightFourOption(),
          onChange: (value){
            if(value == ThemeMode.light){ 
              //todo: Es una condicion para poder hacer el cambio del tema, en esta es un mode lo que da y mejor se maneja con data con la condicion
              GlobalValues.themeApp.value = ThemeSettings.lightTheme();
            } else {
              GlobalValues.themeApp.value = ThemeData.dark();
            }
          }
        ),
      ],*/
      ),
      //drawer: Drawer(),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: userPhoto != null ? FileImage(File(userPhoto!)) : AssetImage("assets/Profile.png"),
                  ), 
                  accountName: Text(userName ?? "Sin nombre de Usuario encontrado", style: Theme.of(context).textTheme.bodyLarge), 
                  accountEmail: Text(userEmail ?? "Sin correo electrónico encontrado", style: Theme.of(context).textTheme.bodyMedium),
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(context, "/leading"),
                  leading: Icon(Icons.design_services),
                  title: Text("Practica Figma"),
                  subtitle: Text("Frontend Page"),
                  trailing: Icon(Icons.chevron_right),
                ),
                ListTile(
                  onTap: () => Navigator.pushNamed(context, "/todo"),
                  leading: Icon(Icons.task),
                  title: Text("Todo App"),
                  subtitle: Text("Task List"),
                  trailing: Icon(Icons.chevron_right),
                ),    
              ],
            ),
            ListTile(
              tileColor: Colors.red[100],
              splashColor: Colors.red,
              onTap: () async {
                await desactivarSesion();
                Navigator.pushNamedAndRemoveUntil(context, "/login", (Route route) => false);
              },
              leading: Icon(Icons.logout),
              title: Text("Cerrar sesión"),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ), 
      endDrawer: ThemeView(),
    );
  }
}