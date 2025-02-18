import 'package:flutter/material.dart';

class LoginTScreen extends StatelessWidget {
  const LoginTScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover, //todo: cubre toda la pantalla con la imagen
            alignment: Alignment.centerRight, //todo: Alinea la imagen a la derecha
            image: AssetImage("assets/Montanas.jpg"),
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 93,
              child: Text(
                "Aspen",
                style: TextStyle(
                  fontSize: 116,
                  fontFamily: "Hiatus", // ! primero referencie en el yaml
                  color: Colors.white,
                  letterSpacing: 8.5, //todo: Pongo espaciado entre las letras
                ),
            )),
            Positioned(
              width: MediaQuery.of(context).size.width * .8,
              top: 553,
              child: Column(
                children: [
                  Align( //todo: No se alineaba, asi que lo meti en un Align, para acomodarlo a la izquierda
                    alignment: Alignment.centerLeft,
                    child: RichText(
                      textAlign: TextAlign.left, //todo: Asegurar que el texto se aline a la izquierda
                      text: TextSpan(
                        style: TextStyle(color: Colors.white),
                        children: [
                          TextSpan(text: 'Plan your\n', style: TextStyle(fontSize: 24, fontFamily: "Montserrat-Regular"),),
                          TextSpan(text: 'Luxurious\n', style: TextStyle(fontSize: 40, fontFamily: "Montserrat-Medium")),
                          TextSpan(text: 'Vacation', style: TextStyle(fontSize: 40, fontFamily: "Montserrat-Medium")),
                        ]
                    )),
                  ),
                  const SizedBox(height: 25),// * Es para meter una separacion entre el texto y el boton
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, "/home");
                    },  
                    child: Container(
                      height: 52,//todo:definir el tamaño del boton
                      width: MediaQuery.of(context).size.width * .79,
                      padding: EdgeInsets.symmetric(horizontal: 44, vertical: 16),//todo: para poder meter un pading de 44 y 16
                      alignment: Alignment.center,// * alinear el texto al centro, el boton
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 25, 110, 238),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Text("Explore", 
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white, fontFamily: "Montserrat-Medium")),
                    ),
                  ),
                ],
              ))
          ],
        ),
      ),
    );
  }
}
