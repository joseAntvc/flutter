import 'package:flutter/material.dart';

class ItemStudentView extends StatelessWidget {
  const ItemStudentView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      // width: MediaQuery.of(context).size.width
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: Color(0xFF006BD8)
        )
      ),
      child: Column(
        children: [
          const Expanded(
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage("https://images.pexels.com/photos/25758/pexels-photo.jpg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                ),
                title: Text("Jose Antonio Vazquez Cabrera"),
                subtitle: Text("No.Control: 21030212"),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * .15,
            decoration: const BoxDecoration(
              color: Color(0xFFEDF3FF),
              borderRadius: BorderRadius.only( 
                bottomLeft: Radius.circular(7), 
                bottomRight: Radius.circular(7),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Table(
                    children: [
                      TableRow(
                        children: [
                          Center(child: Text( 'Semestre', style: TextStyle(color: Color(0xFF006BD8), fontWeight: FontWeight.bold),)),
                          Center(child: Text( 'Clave Materia', style: TextStyle(color: Color(0xFF006BD8), fontWeight: FontWeight.bold),)),
                          Center(child: Text( 'Grupo', style: TextStyle(color: Color(0xFF006BD8), fontWeight: FontWeight.bold),)),
                        ],
                      ),
                      TableRow(
                        children: [
                          Center(child: Text('6')),
                          Center(child: Text( 'DM13')),
                          Center(child: Text( 'B')),
                        ],
                      ),
                    ],
                  ),
                  SizedBox( height: 16,),
                  Text('INGENIERÍA EN SISTEMAS COMPUTACIONALES',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF006BD8)),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
