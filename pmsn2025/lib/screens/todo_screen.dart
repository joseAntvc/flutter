import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmsn2025/database/task_database.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  TaskDatabase? database;
  TextEditingController conTitle = TextEditingController();
  TextEditingController conDesc = TextEditingController();
  TextEditingController conDate = TextEditingController();
  TextEditingController conStts = TextEditingController();
  
  @override
  void initState() {
    // todo: implement initState
    super.initState();
    database = TaskDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("TODO LIST"),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add_task),
        onPressed: () => _dialogBuilder(context)
      ),
      body: FutureBuilder(
        future: database!.SELECT(), 
        builder: (context, snapshot) {
          if(snapshot.hasError){
            //return Text(snapshot.error.toString());
            return Center(child: Text("Algo ocurio durante la ejecución"));
          } else {
            if(snapshot.hasData){
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var obj = snapshot.data![index];
                  return SizedBox(
                    height: 150,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(obj.titleTodo!),
                          subtitle: Text(obj.dateTodo!),
                          trailing: Builder(
                            builder: (context) {
                              if(obj.sttTodo!){
                                return Icon(Icons.check, color: Colors.green,);
                              } else {
                                return Icon(Icons.close, color: Colors.red,);
                              }
                            },
                          ),
                        ),
                        Text(obj.dscTodo!),
                      ],
                    ),
                  );
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

  Future<void> _dialogBuilder(BuildContext context){
    return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text('Add task'),
          content: SizedBox(
            height: 280,
            width: 300,
            child: ListView(
              shrinkWrap: true,//todo: para que se acomode
              children: [
                TextFormField(
                  controller: conTitle,
                  decoration: InputDecoration(hintText: 'Titulo de la tarea'),
                ),
                TextFormField(
                  controller: conDesc,
                  maxLines: 3,
                  decoration: InputDecoration(hintText: 'Descripcion de la tarea'),
                ),
                TextFormField(
                  readOnly: true,
                  controller: conDate,
                  decoration: InputDecoration(hintText: "Fecha de la tarea"),
                  onTap: () async { 
                    DateTime? dateTodo = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2050),
                    );
                    if( dateTodo != null ){
                      String formattedDate = DateFormat('dd/MM/yyyy').format(dateTodo);
                      setState(() {
                        conDate.text = formattedDate;
                      });
                    }
                  },
                ),
                TextFormField(
                  controller: conStts,
                  decoration: InputDecoration(hintText: 'Estatus de la tarea'),
                ),
              ],
            ),
          ),
        );
      }
    );
    
  }
}