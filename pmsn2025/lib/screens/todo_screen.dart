import 'package:flutter/material.dart';
import 'package:pmsn2025/database/task_database.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TaskDatabase? database;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    database = TaskDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO LIST"),),
      body: FutureBuilder(
        future: database!.SELECT(), 
        builder: (context, snapshot) {
          if(snapshot.hasError){
            return Center(child: Text("Algo ocurrio durante la ejecución"));
          } else {
            if(snapshot.hasData){
              return ListView.builder(
                itemBuilder: (context, index) {
                },
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }
        },
      ),
    );
  }
}