import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/to_do_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Map<String, dynamic>> todos = [
    {"todoTitle": "todo 1", "isChecked": false},
    {"todoTitle": "todo 2", "isChecked": true},
    {"todoTitle": "todo 4", "isChecked": true},
    {"todoTitle": "todo 3", "isChecked": false},
  ];

  void onChanged(bool value, int index) {
    setState(() {
      todos[index]['isChecked'] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text(
          "Boring todo",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ToDoTile(
            todoTitle: todos[index]['todoTitle'],
            isChecked: todos[index]['isChecked'],
            onChanged: (val) => onChanged(val!, index),
          );
        },
      ),
    );
  }
}
