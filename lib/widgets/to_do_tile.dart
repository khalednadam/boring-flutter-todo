import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  final bool isChecked;
  final String todoTitle;
  void Function(bool?)? onChanged;
  ToDoTile(
      {super.key,
      required this.isChecked,
      required this.todoTitle,
      required this.onChanged});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
        child: Container(
            decoration: BoxDecoration(
                color: Colors.white70, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.all(12),
            child: Row(children: [
              Checkbox(
                value: widget.isChecked,
                onChanged: widget.onChanged,
                activeColor: Colors.green,
              ),
              Text(
                widget.todoTitle,
                style: TextStyle(
                    decoration: widget.isChecked
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ])));
  }
}
