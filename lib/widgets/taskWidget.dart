import 'package:flutter/widgets.dart';
import 'package:todolist/logic.dart';
import 'package:flutter/material.dart';
Widget wTask(Task t){
  return Container(
    margin: const EdgeInsets.only(bottom: 7),
    child: 
    ListTile(
      //onTap: ,
      //visualDensity: VisualDensity.adaptivePlatformDensity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      
      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      tileColor: const Color.fromARGB(255, 216, 216, 216),
      leading: Checkbox(value: t.active, onChanged: null,),
      title: Text('Tarea: ${t.name}',
      //  style: TextStyle(fontSize: 16),
      ),
      trailing: Icon(
        Icons.bolt,
        color: t.priority == Priority.low ? Colors.green.shade400: t.priority == Priority.medium ? Colors.amber.shade400 : Colors.red.shade900
      ),
  ),
  );
}
