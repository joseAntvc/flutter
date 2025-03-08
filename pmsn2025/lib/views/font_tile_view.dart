import 'package:flutter/material.dart';
import 'package:pmsn2025/utils/global_values.dart';
import 'package:pmsn2025/utils/sesion_values.dart';

class FontTileView extends StatelessWidget {
  const FontTileView({super.key, required this.fontName, required this.selectedFont});

  final String fontName;
  final String selectedFont;

  @override
  Widget build(BuildContext context) {
    final isActive = fontName == selectedFont;
    return ListTile(
      leading: Text("Aa", style: TextStyle(fontFamily: fontName)),
      title: Text(fontName, style: TextStyle(fontFamily: fontName)),
      textColor: isActive ? Colors.white : null,
      tileColor: isActive ? Colors.blue[300] : null,
      onTap: isActive ? null : () {
        GlobalValues.fontApp.value = fontName;
        saveFont(fontName);
      },
    );
  }
}