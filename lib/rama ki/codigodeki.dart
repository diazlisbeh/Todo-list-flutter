import 'package:flutter/material.dart';

void main() {
  runApp(ElliotsApp());
}

class ElliotsApp extends StatelessWidget {
  const ElliotsApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Untouchable Tasks",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
      ),
      home: const Inicio(),
    );
  }
}

class Inicio extends StatefulWidget {
  const Inicio({Key? key});

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  List<TodoItem> todos = [];
  String todo = '';
  final TextEditingController _todoController = TextEditingController();

  void addTodo() {
    setState(() {
      if (todo.isNotEmpty) {
        todos.add(TodoItem(todo, false));
        todo = '';
        _todoController.clear(); // Limpiar el campo de entrada
      }
    });
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  void toggleComplete(int index) {
    setState(() {
      todos[index].isComplete = !todos[index].isComplete;
    });
  }

  void sortTodos() {
    setState(() {
      todos.sort((a, b) {
        if (a.isComplete && !b.isComplete) {
          return 1;
        } else if (!a.isComplete & b.isComplete) {
          return -1;
        } else {
          return 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Present Tasks'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(
                    right: 20,
                    left: 20,
                    bottom: 20,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.grey,
                        offset: Offset.zero,
                        blurRadius: 10.0,
                        spreadRadius: 0,
                      ),
                    ],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextField(
                    controller: _todoController, // Usa el controlador
                    onChanged: (text) {
                      setState(() {
                        todo = text;
                      });
                    },
                    onSubmitted: (text) {
                      addTodo();
                    },
                    decoration: InputDecoration(
                      hintText: 'Agrega una nueva tarea',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 20, right: 20),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: addTodo,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 60),
                        elevation: 10,
                      ),
                      child: const Icon(
                        Icons.add,
                        size: 30,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: sortTodos,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(60, 60),
                        elevation: 10,
                      ),
                      child: const Icon(
                        Icons.sort,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: todos
                  .asMap()
                  .entries
                  .map((entry) {
                    final index = entry.key;
                    final task = entry.value;
                    return wTask(
                      task,
                      index,
                    );
                  })
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget wTask(TodoItem t, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 7),
      child: ListTile(
        onTap: () {
          toggleComplete(index);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
        tileColor: t.isComplete ? Colors.grey : null,
        leading: Container(
          alignment: Alignment.centerLeft,
          width: 56,
          child: Row(
            children: [
              Checkbox(
                value: t.isComplete,
                onChanged: (value) {
                  toggleComplete(index);
                },
              ),
              Icon(
                Icons.bolt,
                color: t.isComplete
                    ? Colors.green.shade400
                    : t.isComplete
                        ? Colors.amber.shade400
                        : Colors.red.shade900,
              ),
            ],
          ),
        ),
        title: Text(
          'Tarea: ${t.task}',
        ),
        trailing: IconButton(
          iconSize: 20,
          icon: const Icon(Icons.delete),
          color: Colors.red.shade800,
          tooltip: 'Eliminar esta tarea',
          splashRadius: 18,
          onPressed: () {
            deleteTodo(index);
          },
        ),
      ),
    );
  }
}

class TodoItem {
  String task;
  bool isComplete;

  TodoItem(this.task, this.isComplete);
}