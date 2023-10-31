import 'package:flutter/material.dart';
import 'package:todolist/logic.dart';

void main() => runApp(ElliotsApp());

class ElliotsApp extends StatelessWidget {
  const ElliotsApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      title: "Untouchable Tasks",
      home: Inicio(),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Present Tasks'),
      ),
        body: ListView(
          children: [
            wTask(Task("Pet the dog", Priority.medium)),
            wTask(Task("Finish The Project", Priority.high)),
            wTask(Task("Sleep", Priority.low))
          ],
        )
        
    );
  }
}

Widget wTask(Task t){
  return Container(
    child: Row(
      children: [
        Text("Tarea: ${t.name}"),
        const Text("Priority: "),
        Icon(
          Icons.bolt,
          color: t.p == Priority.low ? Colors.green.shade400: t.p == Priority.medium ? Colors.amber.shade400 : Colors.red.shade900,
        ),
        Checkbox(value: t.active, onChanged: null)
      ],
    ),
  );
}
