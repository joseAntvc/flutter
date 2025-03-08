import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pmsn2025/utils/custom_toast.dart';
import 'package:pmsn2025/views/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  File? photo;

  //Sirve para obtener la imagen del usuario desde galaeria o camara
  Future<void> pickImage(ImageSource source) async {
    final pickedPhoto = await ImagePicker().pickImage(source: source);
    if (pickedPhoto != null) {
      setState(() {
        photo = File(pickedPhoto.path);
      });
    }
  }
  //Son las opciones para seleccionar la imagen del usuario
  void showOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SafeArea(
          child: Wrap(
            children: [
              ListTile(leading: Icon(Icons.camera), title: Text("Tomar foto"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.camera);
                },
              ),
              ListTile(leading: Icon(Icons.photo_library),title: Text("Seleccionar de la galería"),
                onTap: () {
                  Navigator.pop(context);
                  pickImage(ImageSource.gallery);
                },
              ),
            ],
          ),
        );
      },
    );
  }
  
  //Funcion para poder guardar los datos del usuario
  Future<void> saveUserData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString("user_photo", photo!.path);
    await prefs.setString("user_name", conName.text);
    await prefs.setString("user_email", conEmail.text);
    await prefs.setString("user_password", conPassword.text);
    CustomToast.show(context, "Usuario Registrado");
    Navigator.pushNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF18396a),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 50, bottom: 10),
            width: MediaQuery.of(context).size.width * 0.85,
            height: MediaQuery.of(context).size.height * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
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
                          InkWell(
                            onTap: () => showOptions(),
                            child: CircleAvatar(
                              radius: 50,
                              backgroundColor: const Color(0xFF18396a),
                              backgroundImage: photo == null ? null : FileImage(photo!),
                              child: photo == null ? Icon(Icons.add_a_photo, color: Colors.white, size: 50) : null,
                            ),
                          ),
                          CustomTextField(
                              controller: conName,
                              hintText: "Nombre completo",
                              icon: Icons.person,
                              validator: (value) => (value == null || value.isEmpty) ? 'El nombre es requerido' : null,
                          ),
                          CustomTextField(
                              controller: conEmail,
                              hintText: "Email",
                              icon: Icons.email,
                              validator: (value) => (value == null || value.isEmpty) 
                                ? 'El email es requerido' 
                                : (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) 
                                  ? 'El email no es válido' 
                                  : null,
                          ),
                          CustomTextField(
                              controller: conPassword,
                              obscureText: true,
                              hintText: "Contraseña",
                              icon: Icons.lock,
                              validator: (value) {
                                // Validar si la contraseña está vacía
                                if (value == null || value.isEmpty) return 'La contraseña es requerida';
                                // Validar la longitud mínima (por ejemplo, 8 caracteres)
                                if (value.length < 8) return 'Debe tener al menos 8 caracteres';
                                // Validar la presencia de al menos una letra mayúscula
                                if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Usar al menos 1 letra mayúscula';  
                                // Validar la presencia de al menos un número
                                if (!RegExp(r'[0-9]').hasMatch(value)) return 'Usar al menos 1 número';
                                // Validar la presencia de al menos un carácter especial
                                if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) return 'Usar al menos 1 carácter especial';
                                // Si pasa todas las validaciones, se devuelve null (sin error)
                                return null;
                              },
                          ),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF18396a)),
                            onPressed: () {
                              if (formKey.currentState!.validate() && photo != null) {
                                saveUserData();
                              } else if (photo == null) {
                                CustomToast.show(context, "Debes agregar una foto", isError: true);
                              }
                            },
                            child: Text("Registrarse", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                          ),
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