import 'package:flutter/material.dart';
import 'package:pmsn2025/travel/views/item_Facilities_view.dart';

class DetailPlaceScreen extends StatefulWidget {
  const DetailPlaceScreen({super.key});

  @override
  State<DetailPlaceScreen> createState() => _DetailPlaceScreenState();
}

class _DetailPlaceScreenState extends State<DetailPlaceScreen> {
  static ValueNotifier isExpanded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>; 

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top:20),
        child: Column(
          children: [
            SizedBox(
              height: 365,
              child: Stack(
                children: [
                  Container(
                    height: 340,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/${args['image']}"),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 12,
                    top: 12,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xFFF3F8FE),
                      ),
                      child: IconButton(
                        alignment: Alignment.center,
                        highlightColor: Colors.transparent,//todo: con esto quito lo que es como un sobreado del boton
                        hoverColor: Colors.transparent,//todo: quito lo que es que se quite el sombreado cuando estoy con encima del icono
                        onPressed: () => Navigator.pop(context), 
                        icon: const Icon(Icons.keyboard_arrow_left_rounded, color: Color(0xFFB8B8B8), weight: 2)
                      ),
                    ),
                  ),
                  if(args['favorite'])
                  Positioned(
                    top: 321,
                    right: 14,
                    child: Container(
                      width: 44,
                      height: 44,
                      decoration: BoxDecoration(
                        color: Color(0xFFF2F7FD),
                        borderRadius: BorderRadius.circular(80), 
                        boxShadow: [
                          BoxShadow(color: Color.fromARGB(26, 0, 56, 255), offset: Offset(0, 6), blurRadius: 19, spreadRadius: 0),
                        ],
                      ),
                      child: Icon(
                        Icons.favorite,
                        color: const Color(0xFFEC5655),
                        size: 26,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              contentPadding: EdgeInsets.all(0),
              title: Text(args['name'], style: TextStyle(fontFamily: "Montserrat-Medium", color: Color(0xFF232323), fontSize: 24, fontWeight: FontWeight.w600),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 6, left: 5),
                child: Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.star, color: const Color(0xFFDF9652), size: 12),
                    Text("${args['rating']} (355 Reviews)", style: TextStyle(fontFamily: "Montserrat-Regular", color: Color(0xFF606060), fontSize: 12))
                  ],
                ),
              ),
              trailing: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text("Show map", style: TextStyle(fontFamily: "Montserrat-Medium", color: Color(0xFF176FF2), fontSize: 14, fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            SizedBox(height: 6),
            Expanded(
              child: SingleChildScrollView( 
          // !!! Antes habia usado un listview pero dejaba un espacio muy grande entre el ListTiitle y la demas informacion, el problema es que con el paddin no se arreglaba, por eso el SingleScroll
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    ValueListenableBuilder(
                      valueListenable: isExpanded,
                      builder: (context, value, _) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              value
                                  ? "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities-skiing, hiking, dining shopping and Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities-skiing, hiking, dining shopping and"
                                  : "Aspen is as close as one can get to a storybook alpine town in America. The choose-your-own-adventure possibilities-skiing, hiking, dining shopping and ....",
                              style: TextStyle(fontFamily: "Montserrat-Regular", fontSize: 14, color: Color(0xFF3A544F)),
                            ),
                            SizedBox(height: 5),
                            GestureDetector(
                              onTap: () {
                                isExpanded.value = !value; 
                              },
                              child: Row(
                                spacing: 4,
                                children: [
                                  Text(
                                    value ? 'Show less' : 'Read more',
                                    style: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 14, color: Color(0xFF196EEE), fontWeight: FontWeight.bold),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Icon(
                                      value ? Icons.keyboard_arrow_up_rounded  : Icons.keyboard_arrow_down_rounded, // Cambia el ícono según tu preferencia
                                      color: Color(0xFF196EEE),
                                      size: 22,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                    SizedBox(height: 32),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Text("Facilities", 
                        style: TextStyle(color: Color(0xFF232323), fontFamily:  "Montserrat-Medium", fontSize: 18, fontWeight: FontWeight.w600), 
                      ),
                    ),
                    SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        spacing: 14,
                        children: [
                          ItemFacilitiesView(image: "wifi.png", desc: "1 Heater"),
                          ItemFacilitiesView(image: "food.png", desc: "Dinner"),
                          ItemFacilitiesView(image: "bath.png", desc: "1 Tub"),
                          ItemFacilitiesView(image: "Pool.png", desc: "Pool"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: ListTile(
        contentPadding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
        title: Text("Price", style: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 12, color: Color(0xFF232323))),
        subtitle: Text("\$199", style: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 24, color: Color(0xFF2DD7A4), fontWeight: FontWeight.bold)),
        trailing: Container(
          width: 223,
          height: 56,
          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xFF196EEE),
            boxShadow: [
              BoxShadow(color: Color.fromARGB(61, 0, 56, 255), offset: Offset(0, 6), blurRadius: 19, spreadRadius: 0),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              Text("Book Now", style: TextStyle(fontSize: 16, fontFamily: "Montserrat-Medium", fontWeight: FontWeight.bold, color: Colors.white)),
              Image.asset("assets/ArrowR.png")
            ],
          ),
        ),
      ),
    );
  }
}