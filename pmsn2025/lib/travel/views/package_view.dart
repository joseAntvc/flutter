import 'package:flutter/material.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key, required this.image, required this.name, required this.days, required this.nights});

  final String image;
  final String name;
  final int days;
  final int nights;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 174,
      height: 142,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color(0xFFF4F4F4),
          width: 1,
        ),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Color(0x2B97A0B2), offset: Offset(1, 1), blurRadius: 2, spreadRadius: 0),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 4, top: 4, right: 4,
            child: Container(
              width: 166,
              height: 96,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(fit: BoxFit.cover, image: AssetImage("assets/$image")),
              ),
            ),
          ),
          Positioned(
            top: 88, right: 13,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xFF3A544F),
                border: Border.all(
                  color: Colors.white,
                  width: 2
                ),
              ),
              child: Text("$nights""N/$days""D", style: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 10, fontWeight: FontWeight.bold, color: Colors.white),),
            ),
          ),
          Positioned(
            bottom: 19, left: 4,
            child: Text(name, style: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 14, color: Color(0xFF232323)),),
          ),
          Positioned(
            bottom: 4, left: 6,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 4,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 4),
                  child: Image.asset("assets/shape.png", width: 12, color: Color(0xFF84ABE4),)
                ),
                Text("Hot Deal", style: TextStyle(fontFamily: "Montserrat-Regular", fontSize: 10, color: Color(0xFF3A544F)),)
              ],
            ),
          ), 
        ],
      ),
    );
  }
}