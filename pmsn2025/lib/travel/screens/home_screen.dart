import 'package:flutter/material.dart';
import 'package:pmsn2025/travel/views/home_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; //todo: indice del bottomNavigation
  static List<Widget> widgetOptions = <Widget>[
    HomeView(),
    Scaffold(backgroundColor: Colors.white, body: Center(child: Text("Index 1: Tickets"))),
    Scaffold(backgroundColor: Colors.white, body: Center(child: Text("Index 2: Favoritos"))),
    Scaffold(backgroundColor: Colors.white, body: Center(child: Text("Index 3: Perfil"))),
  ];

  void selectNavigation(int index) {
    //todo: una funcion para cambiar la pantalla desde el indice de navegación
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,// ! Se lo puse porque en el explorar como que aparece de un color rosita tenue
      resizeToAvoidBottomInset: true,//todo: para que no se mueva el bottomNavigation cuando aparece el teclado
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top:44),
        child: widgetOptions.elementAt(selectedIndex)
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(//todo: para darle un efecto de blur al bottomNavigation
          boxShadow: [
            BoxShadow(color: Color(0x0D186FF2), offset: Offset(15, -19), blurRadius: 22, spreadRadius: 0),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(//todo: para redondear las esquinas del bottomNavigation
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
          child: BottomNavigationBar(
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed, //todo: es para dejar fija su posicion, antes como que empujaba los otros botones a los lados
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home_filled, size: 30), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.airplane_ticket_outlined, size: 30), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.favorite_outline, size: 30), label: ""),
                BottomNavigationBarItem(icon: Icon(Icons.person_outline, size: 30), label: ""),
              ],
              currentIndex: selectedIndex,
              unselectedItemColor: Colors.grey,
              selectedItemColor: const Color.fromARGB(255, 25, 110, 238),
              onTap: selectNavigation,
              showSelectedLabels: false,
              showUnselectedLabels: false,
            ),
          ),
        ),
    );
  }
}
