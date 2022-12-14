import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  const TodoTile({
    super.key,
    required this.completed,
    required this.title,
    required this.onDelete,
    required this.onChecked,
  });
  final bool completed;
  final String title;
  final Function onDelete;
  final Function(bool) onChecked;

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
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      elevation: 0,
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 16),
      child: ListTile(
          contentPadding: const EdgeInsets.all(12.0),
          dense: true,
          leading: Checkbox(
            fillColor: const MaterialStatePropertyAll(
              Colors.purple,
            ),
            value: _isChecked,
            onChanged: (value) {
              setState(() {
                _isChecked = value ?? false;
              });
              widget.onChecked(_isChecked);
            },
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              color: _isDeleted ? Colors.red : null,
              decoration: _isChecked ? TextDecoration.lineThrough : TextDecoration.none,
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
          trailing: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              fixedSize: const Size.square(40),
            ),
            child: const Icon(
              Icons.delete,
              size: 16.0,
              color: Colors.white,
            ),
            onPressed: () => widget.onDelete(),
          )
          //  IconButton(
          //   icon: const Icon(Icons.delete),
          //   onPressed: () {
          //     widget.onDelete();
          //     // setState(() {
          //     //   _isDeleted = !_isDeleted;
          //     //   // isDeleted === true, isDeleted = false
          //     //   // isDeleted === false, isDeleted = true
          //     // });
          //   },
          // ),
          ),
    );
  }
}
