import 'package:flutter/material.dart';
import 'package:pmsn2025/travel/views/home_view.dart';
import 'package:pmsn2025/travel/views/meme_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0; //todo: indice del bottomNavigation
  static List<Widget> widgetOptions = <Widget>[
    HomeView(),
    MemeView(title: "Tickets"),
    MemeView(title: "Favoritos"),
    MemeView(title: "Perfil"),
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
        margin: const EdgeInsets.only(left: 20, top:44),
        child: widgetOptions.elementAt(selectedIndex)
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(//todo: para darle un efecto de blur al bottomNavigation
          boxShadow: [
            BoxShadow(color: Color(0x0D186FF2), offset: Offset(0, -15), blurRadius: 22, spreadRadius: 5),
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
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(icon: Image.asset("assets/Home.png", width: 25), activeIcon: Image.asset("assets/HomeA.png", width: 30), label: ""),
              BottomNavigationBarItem(icon: Image.asset("assets/Ticket.png", width: 25), activeIcon: Image.asset("assets/TicketA.png", width: 32), label: ""),
              BottomNavigationBarItem(icon: Image.asset("assets/Heart.png", width: 25), activeIcon: Image.asset("assets/HeartA.png", width: 30), label: ""),
              BottomNavigationBarItem(icon: Image.asset("assets/Profile.png", width: 25), activeIcon: Image.asset("assets/ProfileA.png", width: 30), label: ""),
            ],
            currentIndex: selectedIndex,
            onTap: selectNavigation,
            unselectedItemColor: Colors.grey,//todo: el color del icon cuando no esta seleccionado
            selectedItemColor: const Color.fromARGB(255, 25, 110, 238),//todo: para cuando el item esta seleccionado
            showSelectedLabels: false,//todo: Para no mostrar los labels, el texto debajo del icono
            showUnselectedLabels: false,//todo: Para no mostrar los labels, el texto debajo del icono
          ),
        ),
      ),
    );
  }
}
