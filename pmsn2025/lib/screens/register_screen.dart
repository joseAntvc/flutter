import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  final formKey = GlobalKey<FormState>();
  TextEditingController conPhoto = TextEditingController();
  TextEditingController conName = TextEditingController();
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPassword = TextEditingController();

  InputDecoration customInputDecoration(String hintText) {
    return InputDecoration(
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.grey[600], fontSize: 16, fontWeight: FontWeight.w500),
      filled: true,//todo: se activa el color de fondo
      fillColor: Colors.white,//todo: para cambiar el color de fondo
      contentPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide.none),
    );
  }

  Widget customTextField(String label, TextEditingController controller, {bool obscureText = false}) => Material(
    borderRadius: BorderRadius.circular(30),
    elevation: 3,
    shadowColor: const Color(0xFF18396a),
    child: TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: customInputDecoration(label),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18396a),
      body: Center(
        child: Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width * 0.85,
          height: MediaQuery.of(context).size.height * 0.7,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 50, bottom: 10),
            child: Column(
              children: [
                Text("Registro", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: const Color(0xFF18396a))),
                Expanded(
                  child: Form(
                    key: formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        spacing: 20,
                        children: [
                          CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.blue,
                            child: Icon(Icons.image_search_outlined, color: Colors.white, size: 50),
                          ),
                          customTextField("Nombre completo", conName),
                          customTextField("Email", conEmail),
                          customTextField("Password", conPassword, obscureText: true),
                        ],
                      ),
                    ),
                  ),
                ),
                Divider(
                  color: Colors.grey, // Color de la línea
                  thickness: 1, // Grosor de la línea
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 5,
                  children: [
                    Text("Tienes cuenta?"),
                    InkWell(
                      onTap: () => Navigator.pushNamed(context, "/login"),
                      child: Text("Inicia sesión", style: TextStyle(color: Colors.blue)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}