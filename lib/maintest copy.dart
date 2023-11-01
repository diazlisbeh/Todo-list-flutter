import 'package:flutter/material.dart';
import 'package:todolist/logic.dart';

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
              child: ListView(
                children: [
                  wTask(Task("Pet the dog", Priority.medium)),
                  wTask(Task("Finish The Project", Priority.high)),
                  wTask(Task("Sleep", Priority.low))
                ],
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
                    child: const TextField(
                      decoration: InputDecoration(
                          hintText: 'Agregue un nueva tarea',
                          border: InputBorder.none),
                    ),
                  )),
                  Container(
                    margin: const EdgeInsets.only(bottom: 20, right: 20),
                    child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(60, 60),
                          elevation: 10,
                        ),
                        child: const Icon(
                          Icons.add,
                          size: 30,
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

Widget wTask(Task t) {
  final chkTASK = GlobalKey();
  void marcarcompletada(Task t2) {
    t2.active = !t2.active;
  }

  return Container(
    margin: const EdgeInsets.only(bottom: 7),
    child: ListTile(
      onTap: () {
        marcarcompletada(t);
      },
      //visualDensity: VisualDensity.adaptivePlatformDensity,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

      contentPadding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      tileColor: const Color.fromARGB(255, 216, 216, 216),
      leading: Container(
          alignment: Alignment.centerLeft,
          width: 56,
          child: Row(
            children: [
              Checkbox(
                  value: t.active,
                  key: chkTASK,
                  onChanged: (value) {
                    t.active = value!;
                  }),
              Icon(Icons.bolt,
                  color: t.priority == Priority.low
                      ? Colors.green.shade400
                      : t.priority == Priority.medium
                          ? Colors.amber.shade400
                          : Colors.red.shade900),
            ],
          )),
      title: Text(
        'Tarea: ${t.name}',
        //  style: TextStyle(fontSize: 16),
      ),
      trailing: IconButton(
        iconSize: 20,
        icon: const Icon(Icons.delete),
        color: Colors.red.shade800,
        tooltip: 'Eliminar esta tarea',
        splashRadius: 18,
        onPressed: () {},
      ),
    ),
  );
}
