import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  bool isChecked;
  String todoTitle;
  void Function(bool?)? onChanged;
  void Function(BuildContext)? deleteTodo;

  ToDoTile(
      {super.key,
      required this.isChecked,
      required this.todoTitle,
      required this.onChanged,
      required this.deleteTodo});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0, top: 25.0),
        child: Slidable(
            endActionPane: ActionPane(motion: StretchMotion(), children: [
              SlidableAction(
                backgroundColor: Colors.red,
                borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(10)),
                onPressed: deleteTodo,
                icon: Icons.delete,
              )
            ]),
            child: Container(
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.all(12),
                child: Row(children: [
                  Checkbox(
                    value: isChecked,
                    onChanged: onChanged,
                    activeColor: Colors.green,
                  ),
                  Text(
                    todoTitle,
                    style: TextStyle(
                        decoration: isChecked
                            ? TextDecoration.lineThrough
                            : TextDecoration.none),
                  ),
                ]))));
  }
}
