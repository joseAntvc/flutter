import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int contador = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xffb74093),
          title: Center(
            child: Text('Hola mundo :)', 
              style: TextStyle(
                fontSize: 30,
                fontFamily: 'SWar',
                //fontWeight: FontWeight.bold,
                color: Colors.white
            ),),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          //child: Icon(Icons.ads_click, color: Colors.pinkAccent,),
          child: Image.network('https://celaya.tecnm.mx/wp-content/uploads/2021/02/cropped-FAV.png'),
          onPressed: (){
            contador++;
            setState(() {
              
            });
          }
        ),
        body: Center(
          child: Text('Valor del contador $contador',
          style: TextStyle(fontSize: 20),))
      ),
    );
  }
}