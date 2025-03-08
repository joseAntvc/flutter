import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key, 
    required this.controller, 
    required this.hintText, 
    required this.icon, 
    this.obscureText = false, 
    required this.validator
  });

  final TextEditingController controller;
  final String hintText;
  final IconData icon;
  final bool obscureText;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(30),
      elevation: 3,
      shadowColor: const Color(0xFF18396a),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: customInputDecoration(hintText, icon),
        validator: validator,
      ),
    );
  }
}

InputDecoration customInputDecoration(String hintText, IconData icon) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16, fontWeight: FontWeight.w500),
      filled: true,//todo: se activa el color de fondo
      fillColor: Colors.white,//todo: para cambiar el color de fondo
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
      prefixIcon: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15), // Ajusta el espacio del icono
        child: Icon(icon, color: Colors.grey[600]),
      ),
    );
  }