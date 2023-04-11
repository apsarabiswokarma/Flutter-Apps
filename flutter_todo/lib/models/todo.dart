class Todo {
  final String title;
  bool completed;

  Todo(this.title, this.completed);
  // Todo({required this.title, required this.completed});
}

// Todo t = Todo(title: title, completed: completed)

List<Todo> todos = [
  Todo("Learning", false),
  Todo("Learning 2", false),
  Todo("Learning 3", false),
];
