import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/widgets/todo_tile.dart';

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
        todos = [(Todo(title, false)), ...todos];
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

  // void _checkAll() {
  //   setState(() {
  //     todos[0].completed = true;
  //   });

  //   print(todos[0].completed);
  // }

  void _checkAll() {
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
        backgroundColor: const Color(0xffeeeff4),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.5,
          title: const Text(
            'TO DO',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          actions: [
            Tooltip(
              message: "Delete All",
              child: IconButton(
                onPressed: _deleteall,
                icon: const Icon(Icons.delete, color: Colors.red),
              ),
            ),
            Tooltip(
              message: "Check All",
              child: IconButton(
                onPressed: () {
                  _checkAll();
                },
                icon: const Icon(
                  Icons.check_box_rounded,
                  color: Colors.black,
                ),
              ),
            )
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 36,
              ),
              const Text(
                "All ToDos",
                style: TextStyle(
                  color: Color(0xff2a2b31),
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 24,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return TodoTile(
                      onChecked: (checked) async {
                        if (checked) {
                          var checkedTodo = todos.removeAt(index);
                          checkedTodo.completed = true;
                          setState(() {
                            todos.add(checkedTodo);
                          });
                        }
                      },
                      completed: todos[index].completed,
                      title: todos[index].title,
                      onDelete: () {
                        _deleteTodoAtIndex(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
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
              decoration: const InputDecoration(
                border: InputBorder.none,
                fillColor: Colors.white,
                filled: true,
                hintText: "Add new To Do",
              ),
              controller: textEditingController,
            )),
            const SizedBox(
              width: 20,
            ), // Take all the remaining width
            SizedBox(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.square(50),
                ),
                onPressed: _addTodo,
                child: const Icon(Icons.add),
              ),
            )
          ],
        ),
      ),
    );
  }
}
