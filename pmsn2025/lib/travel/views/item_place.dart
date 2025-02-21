import 'package:flutter/material.dart';

class ItemPlace extends StatelessWidget {
  const ItemPlace({
    super.key, 
    required this.imageName, 
    required this.name, 
    required this.rating, 
    this.isFavorite = false,

  });

  final String imageName;
  final String name;
  final double rating;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,//todo: con esto quito lo que es como un sobreado del boton
      hoverColor: Colors.transparent,//todo: quito lo que es que se quite el sombreado cuando estoy con encima del icono            
      onTap: () {
        Navigator.pushNamed(context, "/detail_place", 
          arguments: {'image': imageName, 'name': name, 'rating': rating, 'favorite': isFavorite});
      },
      child: Container(
        width: 188,
        height: 240,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage("assets/$imageName"),
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              left: 12, bottom: 12,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF4D5652),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  spacing: 4,
                  children: [
                    Icon(Icons.star, color: const Color(0xFFF8D675), size: 11),
                    Text(rating.toString(), style: TextStyle(fontFamily: "Montserrat-Medium", color: Colors.white, fontSize: 10),),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 12, bottom: 42,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF4D5652),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(name, style: TextStyle(fontFamily: "Montserrat-Medium", color: Colors.white, fontSize: 12),), 
              ),
            ),
          if(isFavorite)
            Positioned(
              right: 16, bottom: 16,
              child: Container(
                height: 24, width: 24,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(80), 
                ),
                child: Icon(
                  Icons.favorite,
                  color: const Color(0xFFEC5655),
                  size: 11,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
