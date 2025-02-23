import 'package:flutter/material.dart';

class MemeView extends StatelessWidget {
  const MemeView({super.key, required this.title});

  final String title;

  static TextStyle titleStyle = TextStyle(
    fontFamily: "Montserrat-Medium",
    color: Colors.white,
    fontSize: 20,
    fontWeight: FontWeight.bold,
    shadows: [
      Shadow(
        blurRadius: 15,
        color: Colors.black,
        offset: Offset(2, 2),
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/Meme.jpg"),
        ),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: MediaQuery.of(context).size.height*0.13,
            child: Text(
              "Aqui pondría mi pestaña\n$title", 
              textAlign: TextAlign.center,
              style: titleStyle
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height*0.45,
            child: Text(
              "Si tuviera una!!!", 
              style: titleStyle
            ),
          ),
        ],
      ),
    );
  }
}