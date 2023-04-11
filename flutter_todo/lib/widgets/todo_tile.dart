import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({
    super.key,
    required this.completed,
    required this.title,
    required this.onDelete,
  });
  final bool completed;
  final String title;
  final Function onDelete;

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  bool _isChecked = false;
  final bool _isDeleted = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.completed;
  }

  @override
  void didUpdateWidget(covariant TodoTile oldWidget) {
    _isChecked = widget.completed;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Checkbox(
        value: _isChecked,
        onChanged: (value) {
          setState(() {
            _isChecked = value ?? false;
          });
        },
      ),
      title: Text(
        widget.title,
        style: TextStyle(
          color: _isDeleted ? Colors.red : null,
          decoration:
              _isChecked ? TextDecoration.lineThrough : TextDecoration.none,
        ),
      ),
      // trailing: GestureDetector(
      //   onTap: () {
      //     setState(() {
      //       _isDeleted = !_isDeleted;
      //       // isDeleted === true, isDeleted = false
      //       // isDeleted === false, isDeleted = true
      //     });
      //   },
      //   child: const Icon(Icons.delete),
      // ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          widget.onDelete();
          // setState(() {
          //   _isDeleted = !_isDeleted;
          //   // isDeleted === true, isDeleted = false
          //   // isDeleted === false, isDeleted = true
          // });
        },
      ),
    );
  }
}
