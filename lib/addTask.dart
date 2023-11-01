 import 'package:todolist/logic.dart';
 import 'package:flutter/widgets.dart';
 import 'package:todolist/widgets/taskWidget.dart';
 
 var widgetsTaskList = <Widget>[wTask(taskList[0])];
 var taskList = <Task>[Task(taskName, Priority.low)];
 var taskName = "";
int tasklistLength = taskList.length;

void addTask(){
  var nesTask = Task(taskName, Priority.medium);
  taskList.add(nesTask);
  widgetsTaskList.add(wTask(taskList[taskList.length -1]));
}
