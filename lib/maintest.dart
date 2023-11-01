import 'package:flutter/material.dart';
import 'package:todolist/logic.dart';
import 'package:todolist/addTask.dart';

void main() => runApp(ElliotsApp());

class ElliotsApp extends StatelessWidget {
  const ElliotsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Untouchable Tasks",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({super.key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Theme.of(context).colorScheme.primary,
          title: const Text('Present Tasks'),
        ),
        body: Stack(
          //alignment: Alignment.center,
          children: [
            Container(
              margin: const EdgeInsets.all(7),
              child: ListView.builder(
                itemCount: widgetsTaskList.length,
                itemBuilder: (context, index) {
                  return widgetsTaskList[index];
                },
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                /*crossAxisAlignment: CrossAxisAlignment.start,*/
                children: [
                  Expanded(
                      child: Container(
                    margin:
                        const EdgeInsets.only(right: 20, left: 20, bottom: 20),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey,
                          offset: Offset.zero,
                          blurRadius: 10.0,
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      onChanged: (text) {
                        setState(() {
                          taskName = text;
                        });
                      },
                      decoration: const InputDecoration(
                          hintText: 'Agregue un nueva tarea',
                          border: InputBorder.none),
                    ),
                  )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          addTask();
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 60),
                        elevation: 10,
                      ),
                      child: const Text(
                        '+',
                        style: TextStyle(fontSize: 40),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
