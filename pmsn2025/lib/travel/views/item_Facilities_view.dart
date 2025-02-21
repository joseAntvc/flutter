import 'package:flutter/material.dart';

class ItemFacilitiesView extends StatelessWidget {
  const ItemFacilitiesView({super.key, required this.image, required this.desc});

  final String image;
  final String desc;


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 74,
      width: 77,
      padding: EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Color.fromARGB(13, 25, 110, 238)
      ),
      child: Column(
        children: [
          Image.asset("assets/$image",width: 32),
          SizedBox(height: 2),
          Text(desc, style: TextStyle(fontFamily:  "Montserrat-Medium", fontSize: 10, color: Color(0xFFB8B8B8)),)
        ],
      ),
    );
  }
}