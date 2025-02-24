import 'package:flutter/material.dart';
import 'package:pmsn2025/travel/utils/global_value.dart';
import 'package:pmsn2025/travel/views/barHorizontal_view.dart';
import 'package:pmsn2025/travel/views/headed_view.dart';
import 'package:pmsn2025/travel/views/item_place.dart';
import 'package:pmsn2025/travel/views/package_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> { //todo: SingleTicketProviderStateMixin es para que el tabController funcione
  
  List<String> location = <String>["Aspen, USA", "New York, USA", "Guanajuato, MEX"];

  final txtSearch = TextFormField( //todo: para hacer el campo de busqueda, si es que se puede usar en mas cosas, lo puedo pasar a un archivo nuevo
    textAlign: TextAlign.left,
    decoration: InputDecoration(
      hintText: "Find things to do",
      hintStyle: TextStyle(color: Color(0xFFB8B8B8), fontSize: 15, fontFamily: "Montserrat-Medium"),
      border: InputBorder.none, //todo: para quitar el borde o una linea fea que se pone abajo
      prefixIcon: Image.asset("assets/Search.png", scale: 3),//todo: poner un icono al inicio
      contentPadding: EdgeInsets.only(top: 16, bottom: 16, left: 16) 
  ),);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.only(right: 20),//todo: para quitar el padding
          title: Text("Explore", style: TextStyle(fontFamily: "Montserrat-Regular", fontSize: 14, color: Colors.black),),
          subtitle: Text("Aspen", style: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 32, color: Colors.black),),// ! ocupe poner el color black porque sino estaba mas claro
          trailing: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/location-1.png", width: 16,),
                  SizedBox(width: 6,),
                  /*Text("Aspen, USA"),
                  SizedBox(width: 6,),
                  Icon(Icons.keyboard_arrow_down, color: Color.fromARGB(255, 25, 110, 238)),*/
                  //?
                  /*DropdownMenu(
                    initialSelection: location[0],
                    width: 100,
                    textStyle: TextStyle(fontFamily: "Montserrat-Regular", fontSize: 12),
                    requestFocusOnTap: true,
                    trailingIcon: Icon(Icons.keyboard_arrow_down, color: Color.fromARGB(255, 25, 110, 238)),
                    dropdownMenuEntries: location.map((l) {
                      return DropdownMenuEntry(
                        value: l, 
                        label: l
                      );
                    }).toList(),     
                  ),*/
                  ValueListenableBuilder(
                    valueListenable: GlobalValue.isLocation,
                    builder: (context, value, child) {
                      return DropdownButtonHideUnderline(//todo: para quitar la linea del dropdown
                        child: SizedBox(
                          width: 100,//todo: ancho del la lista desplegable
                          child: DropdownButton(
                            focusColor: Colors.transparent,//todo: para quitar como el sombreado cuando selecciono uno
                            dropdownColor: Colors.white,//todo: para poder darle un color de fondo a selected
                            isExpanded: true, //todo: ya que arriba le define un ancho, si el texto ocupa mas del ancho se recorta
                            value: location[GlobalValue.isLocation.value],//todo: valor seleccionado
                            icon: Icon(Icons.keyboard_arrow_down, color: Color.fromARGB(255, 25, 110, 238)),//todo: icono de flecha
                            isDense: true,//todo: pocas palabras le quita el padding vertical
                            style: TextStyle(fontFamily: "Montserrat-Regular", fontSize: 12, color: Colors.black),
                            onChanged: (String? selected) {
                              if(selected is String){ // ! necesito hacer esto, porque sino marca error, tambien podria checar que solo sea diferente de null
                                GlobalValue.isLocation.value = location.indexOf(selected);
                              }
                            },// ! ocupa el onChanged porque sino marca error
                            items: location.map((loc) {
                              return DropdownMenuItem<String>(//todo: para crear los items del dropdown
                                value: loc, child: Text(loc, overflow: TextOverflow.ellipsis,)// ! el child debe ir al ultimo, sino lo subraya de azul, no es error
                              );
                            }).toList(),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Container(
            padding: EdgeInsets.only(left: 16),
            height: 52,
            width: MediaQuery.of(context).size.width*0.9, //* le doy casi el tamaño completo de la pantalla
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 243, 248, 254),
              borderRadius: BorderRadius.circular(24),
            ),
            child:
              txtSearch,
          ),
        ),
        SizedBox(height: 32),
        BarhorizontalView(),
        SizedBox(height: 10),
        Expanded(
          child: ListView(
            padding: EdgeInsets.only(top: 0, bottom: 15),
            physics: BouncingScrollPhysics(),
            children: [
              HeadedView(headed: "Popular"),
              SizedBox(// !!! necesito encerrarlo en un sizedbox o conatiner para que funcione
                height: 240,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(padding: const EdgeInsets.only(right: 28), child: ItemPlace(imageName: "Alley.jpg", name: "Alley Palaca", rating: 4.1, isFavorite: true,)),
                    Padding(padding: const EdgeInsets.only(right: 28), child: ItemPlace(imageName: "Coeurdes.jpg", name: "Coeurdes Alpes", rating: 4.5)),
                    Padding(padding: const EdgeInsets.only(right: 28), child: ItemPlace(imageName: "Alley.jpg", name: "Alley Palaca", rating: 3.9)),
                    Padding(padding: const EdgeInsets.only(right: 20), child: ItemPlace(imageName: "Coeurdes.jpg", name: "Coeurdes Alpes", rating: 4, isFavorite: true,)),
                  ],
                ),
              ),
              SizedBox(height: 23),
              HeadedView(headed: "Recommended"),
              SizedBox(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(padding: EdgeInsets.only(right: 18),child: PackageView(image: "Aspen.jpg", name: "Explore Aspen", days: 5, nights: 4,)),
                    Padding(padding: EdgeInsets.only(right: 18),child: PackageView(image: "Luxurious.jpg", name: "Luxurious Aspen", days: 3, nights: 2,)),
                    Padding(padding: EdgeInsets.only(right: 18),child: PackageView(image: "Aspen.jpg", name: "Explore Aspen", days: 7, nights: 6,)),
                    Padding(padding: EdgeInsets.only(right: 20),child: PackageView(image: "Luxurious.jpg", name: "Luxurious Aspen", days: 2, nights: 1)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
