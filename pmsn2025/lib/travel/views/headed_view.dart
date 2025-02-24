import 'package:flutter/material.dart';

class HeadedView extends StatelessWidget {
  const HeadedView({super.key, required this.headed});

  final String headed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(right: 20),
      title: Text(headed, style: TextStyle(fontFamily: "Montserrat-Regular", fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600)),
      trailing: Text("See all", style: TextStyle(fontFamily: "Montserrat-Medium", fontSize: 12, color: Color(0xFF196EEE), fontWeight: FontWeight.bold),),
    );
  }
}