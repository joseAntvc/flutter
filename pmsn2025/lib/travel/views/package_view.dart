import 'package:flutter/material.dart';

class PackageView extends StatelessWidget {
  const PackageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 172,
      height: 142,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.black,
        boxShadow: [
          BoxShadow(color: Color(0x2B97A0B2), offset: Offset(0, 4), blurRadius: 20, spreadRadius: 0),
        ],
      ),
    );
  }
}