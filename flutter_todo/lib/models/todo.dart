class Todo {
  final String title;
  bool completed;

  Todo(this.title, this.completed);
  // Todo({required this.title, required this.completed});
}

// Todo t = Todo(title: title, completed: completed)

List<Todo> todos = [
  Todo("Learning", false),
  Todo("Shopping", false),
  Todo("Zoom Meeting", false),
  Todo("Dinner with family at 9 ", false),
];
