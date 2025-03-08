// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/utils/custom_toast.dart';
import 'package:pmsn2025/utils/sesion_values.dart';
import 'package:pmsn2025/views/custom_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //bool isValidating = false;
  TextEditingController conEmail = TextEditingController();
  TextEditingController conPassword = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool keepSession = false;
  
  Future<void> validateUser() async {
    final prefs = await SharedPreferences.getInstance();
    String email = prefs.getString("user_email") ?? "";
    String password = prefs.getString("user_password") ?? "";

    if(conEmail.text == email && conPassword.text == password){
      CustomToast.show(context, "Iniciando sesión...", disa: false);
      if (keepSession) {await activarSesion();} //Es para maracar que la sesion se debe mantener activada
      Future.delayed(Duration(milliseconds: 3000)).then(
        (value) {
          Navigator.pushNamedAndRemoveUntil(context, "/dash", (Route route) => false); //Es para ir al dashboard y borrar la pantalla anterior
        },
      );
    } else {
      CustomToast.show(context, "Contraseña o nombre de usuario incorrecto", isError: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final txtUser = CustomTextField(
        controller: conEmail,
        hintText: "Email",
        icon: Icons.email,
        validator: (value) => (value == null || value.isEmpty) 
          ? 'El email es requerido' 
          : (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) 
            ? 'El email no es válido' 
            : null,
    );
    final txtPass = CustomTextField(
        controller: conPassword,
        obscureText: true,
        hintText: "Contraseña",
        icon: Icons.lock,
        validator: (value) => (value == null || value.isEmpty) ? 'La contraseña es requerido' : null,
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                opacity: .3,
                image: AssetImage("assets/Fondo.jpg"))),
        child: Stack(
          alignment: Alignment.center,
          children: [
            /* //!!! Ahora estoy haciendo uso de toast para mostrar que se va a ingresar
            Positioned(
              top: MediaQuery.of(context).size.height *.45,
              child: ValueListenableBuilder(
                valueListenable: GlobalValues.isValidating,
                builder: (context, value, _) {
                  return value ? CircularProgressIndicator() : Container();
                },
              ),
              ///child: isValidating ? CircularProgressIndicator() : Container(),
            ),*/
            Positioned(
                top: MediaQuery.of(context).size.height *.2,
                child: Lottie.asset("assets/Tecnm.json", height: 250)),
            Positioned(
                bottom: 20,
                child: Container(
                  padding: EdgeInsets.only(top: 10, bottom: 10),
                  height: 350,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Form(
                          key: formKey,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              spacing: 15,
                              children: [
                                txtUser,
                                txtPass,
                                Row(
                                  spacing: 10,
                                  children: [
                                    Switch(
                                      inactiveTrackColor: Colors.grey[600],//Es el color cuando esta en off (Contorno)
                                      inactiveThumbColor: Colors.white,//Es el color cuando esta en off (Bolita)
                                      activeTrackColor: Colors.green,//Es el color cuando esta en on (Contorno)
                                      activeColor: Colors.white,//Es el color cuando esta en on (Bolita)
                                      value: keepSession,
                                      onChanged: (value) {
                                        setState(() => keepSession = value!);
                                      },
                                    ),
                                    const Text("Mantener sesión activa"),
                                  ],
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF18396a)),
                                  onPressed: () {
                                    if (formKey.currentState!.validate()) {
                                      validateUser();
                                    } 
                                  },
                                  child: Text("Iniciar sesión", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                                ),
                                /*InkWell(
                                  //El otro es el gesturecDetector
                                  onTap: () {
                                    //isValidating = true;
                                    GlobalValues.isValidating.value = true;
                                    Future.delayed(Duration(milliseconds: 4000)).then(
                                      (value) {
                                        GlobalValues.isValidating.value = false;
                                        Navigator.pushNamed(context, "/dash");
                                      },
                                    );
                                  },
                                  /*Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context)=>ListStudentsScreen())),*/
                                  child: Image.asset(
                                    "assets/boton.png",
                                    height: 80,
                                  ),
                                ),*/
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
                          Text("No tienes cuenta?"),
                          InkWell(
                            onTap: () => Navigator.pushNamed(context, "/register"),
                            child: Text("Registarse", style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
