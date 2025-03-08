import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pmsn2025/database/task_database.dart';
import 'package:pmsn2025/utils/global_values.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  TaskDatabase? database;
  TextEditingController conTitle = TextEditingController();
  TextEditingController conDsc = TextEditingController();
  TextEditingController conDate = TextEditingController();
  TextEditingController conStts = TextEditingController();

  @override
  void initState() {
    super.initState();
    database = TaskDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO LIST'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _dialogBuilder(context);
        },
        child: Icon(Icons.add_task),
      ),
      body: ValueListenableBuilder(
        valueListenable: GlobalValues.updList,
        builder: (context, value, widget) {
          return FutureBuilder(
            future: database!.SELECT(),
            builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else if (snapshot.hasData) {
              return ListView.separated(
                separatorBuilder: (context, index) => SizedBox(height: 10),
                padding: const EdgeInsets.all(10),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  var obj = snapshot.data![index];
                  return Container(
                    padding: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      color: Colors.grey[300]
                    ),
                    height: 150,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(obj.titleTodo!),
                          subtitle: Text(obj.dateTodo!),
                          trailing: Builder(builder: (context) {
                            if (obj.sttTodo!) {
                              return Icon(Icons.close);
                            } else {
                              return Icon(Icons.check);
                            }
                          }),
                        ),
                        Text(obj.dscTodo!),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            IconButton(onPressed: (){
                              conTitle.text = obj.titleTodo!;
                              conDsc.text = obj.dscTodo!;
                              conDate.text = obj.dateTodo!;
                              conStts.text = obj.sttTodo!.toString();
                              _dialogBuilder(context, idTodo: obj.idTodo!);
                            }, icon: Icon(Icons.edit)),
                            IconButton(onPressed: (){
                              database!.DELETE('todo', obj.idTodo!).then((value){
                                if(value > 0) {
                                  GlobalValues.updList.value = !GlobalValues.updList.value;
                                }
                              });
                            }, icon: Icon(Icons.delete)),
                          ],
                        ),
                      ],
                    ),
                  );
                }
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          });
        },
      ),
    );
  }

  Future<void> _dialogBuilder(BuildContext context, {int idTodo = 0}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: idTodo == 0 ? Text('Add Task') : Text('Edit Task'),
          content: SizedBox(
            height: 300,
            width: 280,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  decoration: InputDecoration(hintText: 'Titulo de la tarea'),
                  controller: conTitle,
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Descripcion de la tarea'),
                  controller: conDsc,
                  maxLines: 3,
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
                      lastDate: DateTime(2100)
                    );
                    if (dateTodo != null) {
                      String formatDate = DateFormat('yyyy-MM-dd').format(dateTodo);
                      setState(() {
                        conDate.text = formatDate;
                      });
                    }        
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(hintText: 'Status de la tarea'),
                  controller: conStts,
                ),
                Divider(),
                ElevatedButton(
                  onPressed: () {
                    if(idTodo == 0){
                      database!.INSERTAR('todo', {
                        "titleTodo": conTitle.text,
                        "dscTodo": conDsc.text,
                        "dateTodo": conDate.text,
                        "sttTodo": false
                      }).then((value) {
                        if (value > 0) {
                          GlobalValues.updList.value = !GlobalValues.updList.value;
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.success,
                              title: 'Mensaje desde la app',
                              text: 'Datos Insertados correctamente'));
                          }
                        },
                      );
                    } else { 
                      database!.UPDATE('todo', {
                        "idTodo": idTodo,
                        "titleTodo": conTitle.text,
                        "dscTodo": conDsc.text,
                        "dateTodo": conDate.text,
                        "sttTodo": false
                      }).then((value) {
                        if (value > 0) {
                          GlobalValues.updList.value = !GlobalValues.updList.value;
                          ArtSweetAlert.show(
                            context: context,
                            artDialogArgs: ArtDialogArgs(
                              type: ArtSweetAlertType.success,
                              title: 'Mensaje desde la app',
                              text: 'Datos Actualizados correctamente'));
                          }
                        },
                      );
                    }
                    conTitle.clear();
                    conDsc.clear();
                    conDate.clear();
                    conStts.clear();
                    Navigator.pop(context);
                  },
                  child: idTodo == 0 ? Text('Guardar') : Text('Actualizar')),
              ],
            ),
          ),
        );
      }
    );
  }
}