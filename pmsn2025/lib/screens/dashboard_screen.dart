import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/theme_settings.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenidos"),
      actions: [
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
      ],
      ),
      //drawer: Drawer(),
      drawer: Drawer(
        child: ListView(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("https://images.pexels.com/photos/25758/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2")
              ),
              accountName: Text("Jose Antonio Vazquez Cabrera"), 
              accountEmail: Text("21030212@itcelaya.edu.mx"),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, "/leading");
              },
              leading: Icon(Icons.design_services),
              title: Text("Practica  Figma"),
              subtitle: Text("Frontend Page"),
              trailing: Icon(Icons.chevron_right),
            ),
          ],
        ),
      ), 
    );
  }
}