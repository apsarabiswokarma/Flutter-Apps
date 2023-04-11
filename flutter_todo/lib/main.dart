import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/todo_tile.dart';

import 'models/todo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController = TextEditingController();

  void _addTodo() {
    final String title = textEditingController.text;
    if (title.isNotEmpty) {
      setState(() {
        todos.add(Todo(title, false));
      });
      textEditingController.clear();
    }
  }

  /*
  List<int> a = [1];
  a.add(2);

  print(a); 
  o/p:[1,2]

  a.removeAt(0);

  print(a);
  o/p:[2]
   */
  void _deleteall() {
    setState(() {
      todos.clear();
    });
  }

  // void _checkedall() {
  //   setState(() {
  //     todos[0].completed = true;
  //   });

  //   print(todos[0].completed);
  // }

  void _checkedall() {
    setState(() {
      for (int i = 0; i < todos.length; i++) {
        todos[i].completed = true;
      }
    });
  }

  void _deleteTodoAtIndex(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Todo App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('TO DO'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: _deleteall,
              icon: const Icon(Icons.delete, color: Colors.red),
            ),
            IconButton(
              onPressed: () {
                _checkedall();
              },
              icon: const Icon(Icons.check_box_rounded),
            )
          ],
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return TodoTile(
              completed: todos[index].completed,
              title: todos[index].title,
              onDelete: () {
                _deleteTodoAtIndex(index);
              },
            );
          },
        ),
        // body: ListView(
        //   children: const <Widget>[
        //     TodoTile(completed: true, title: "learning"),
        //     TodoTile(completed: false, title: "coding"),
        //     TodoTile(completed: false, title: "dinner with friends"),
        //     TodoTile(completed: false, title: "writing lyrics"),
        //     TodoTile(completed: false, title: "shopping"),
        //   ],
        // ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 40,
            ),
            // const SizedBox(width: 200, child: TextField()), // Take only 200px width
            Expanded(
                child: TextField(
              controller: textEditingController,
            )), // Take all the remaining width
            FloatingActionButton(
              onPressed: _addTodo,
              child: const Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
