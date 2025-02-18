import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pmsn2025/utils/global_values.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //bool isValidating = false;

  @override
  Widget build(BuildContext context) {
    final txtUser = TextFormField(
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce el usuario",
      ),
    );
    final txtPass = TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: "Introduce el password",
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
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
            Positioned(
              top: 500,
              child: ValueListenableBuilder(
                valueListenable: GlobalValues.isValidating,
                builder: (context, value, _) {
                  return value ? CircularProgressIndicator() : Container();
                },
              ),
              //child: isValidating ? CircularProgressIndicator() : Container(),
            ),
            Positioned(
                top: 270,
                child: Lottie.asset("assets/Tecnm.json", height: 250)),
            Positioned(
                bottom: 20,
                child: Container(
                  padding: EdgeInsets.all(10),
                  height: 250,
                  width: MediaQuery.of(context).size.width * .9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      txtUser,
                      const SizedBox(
                        height: 10,
                      ),
                      txtPass,
                      InkWell(
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
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
