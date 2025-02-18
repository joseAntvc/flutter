/**
 * Este lo hice mas que nada para poder verlo de manera mas sencilla ya que en el otro archivo (home_view.dart) 
 * estaba muy largo y no podia verlo bien, ademas si lo pienso bien, lo puedo reutilizar en otros archivos
 * conviertiendolo en un widget o componente en flutter solo pasando el arreglo de las categorias
 */

import 'package:flutter/material.dart';

class BarhorizontalView extends StatefulWidget {
  const BarhorizontalView({super.key});

  @override
  State<BarhorizontalView> createState() => _BarhorizontalViewState();
}

class _BarhorizontalViewState extends State<BarhorizontalView> with SingleTickerProviderStateMixin {
  
  late TabController tabController;
  final category = [Tab(text: "Location"), Tab(text: "Hotels"), Tab(text: "Food"), Tab(text: "Adventure"), Tab(text: "Drinks")];

  @override
  void initState() { //todo: para inicializar el tabController
    tabController = TabController(length: category.length, vsync: this);
    super.initState();
  }
  @override
  void dispose() {//todo: para liberar recursos
    super.dispose();
    tabController.dispose();
  } 
  
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TabBar(
        controller: tabController,
        tabs: category,//todo: son los opciones del menu
        isScrollable: true,//todo: para que se pueda hacer scroll horizontalmente
        unselectedLabelColor: Color(0xFFB8B8B8),//* pestaña no seleccionada
        unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal, fontFamily: "Montserrat-Medium", fontSize: 14),//* pestaña no seleccionada
        labelColor: Color(0xFF196EEE), //* pestaña seleccionada
        labelStyle: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 14, fontWeight: FontWeight.bold),//* pestaña seleccionada
        indicatorSize: TabBarIndicatorSize.tab ,// !!! si pongo del .tab en indicatorSize lo que pasa es que la animacion se sale de la pantalla
        dividerColor: Colors.transparent,//todo: para quitar la linea fea que se pone abajo de los tabs
        physics: BouncingScrollPhysics(),//todo: para que haga el efecto de rebote
        tabAlignment: TabAlignment.start,// !!! Algo importante, se me alineaba la barra como en centro, entonces dejaba mucho espacio, con esto ya no
        overlayColor: WidgetStateProperty.all(Colors.transparent),
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(33),
          color: Color.fromARGB(255, 243, 248, 254),
        ),
      ),
    );
  }
}

/*
List<String> category = ["Location", "Hotels", "Food", "Adventure", "Events"];
Container(
  margin: EdgeInsets.only(left: 20),
  height: 41,
  child: ListView.builder(
    scrollDirection: Axis.horizontal,
    itemCount: category.length,
    itemBuilder: (context, index){
      return Container(
        margin: EdgeInsets.only(right: 28),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text(category[index], style: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 14, color: Color(0xFFB8B8B8)),),
        ),
      );
    },
  ),
),*/