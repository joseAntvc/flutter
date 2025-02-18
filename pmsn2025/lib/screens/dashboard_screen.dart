import 'package:dark_light_button/dark_light_button.dart';
import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Bienvenidos"),
      actions: [
        DarlightButton(
          type: Darlights.DarlightFour,
          onChange: (value){
            GlobalValues.themeApp.value = value;
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