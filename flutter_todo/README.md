# flutter_todo

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


In this code, TextEditingController is used to control the text input in the TextField widget. The textEditingController is created in the _MyAppState class as a private instance variable:

```dart
class _MyAppState extends State<MyApp> {
  TextEditingController textEditingController = TextEditingController();
}
```
  ...
The _addTodo() method is called when the add icon is pressed. This method gets the text entered in the TextField widget using the textEditingController.text property. If the text is not empty, it creates a new Todo object with the entered text and adds it to the todos list:

```dart
void _addTodo() {
  final String title = textEditingController.text;
  if (title.isNotEmpty) {
    setState(() {
      todos.add(Todo(title, false));
    });
    textEditingController.clear();
  }
}
```
Then, the textEditingController.clear() method is called to clear the text input in the TextField widget.

The add icon is displayed as a FloatingActionButton widget. The onPressed callback property of the FloatingActionButton is set to the _addTodo() method:
```dart
floatingActionButton: Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    const SizedBox(
      width: 40,
    ),
    Expanded(
      child: TextField(
        controller: textEditingController,
      ),
    ),
    FloatingActionButton(
      onPressed: _addTodo,
      child: const Icon(Icons.add),
    )
  ],
),
