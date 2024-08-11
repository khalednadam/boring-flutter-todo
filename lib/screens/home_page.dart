import 'package:flutter/material.dart';
import 'package:flutter_todo/widgets/dialog_box.dart';
import 'package:flutter_todo/widgets/to_do_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List<Map<String, dynamic>> todos = [];

  // Methods
  void onChanged(bool value, int index) {
    setState(() {
      todos[index]['isChecked'] = value;
    });
  }

  void onSave() {
    setState(() {
      todos.add({"todoTitle": _controller.text.toString(), "isChecked": false});
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  void onAddTodo() {
    showDialog(
        context: context,
        builder: (context) => DialogBox(
            controller: _controller,
            onSave: onSave,
            onCancel: () => Navigator.of(context).pop()));
  }

  void deleteTodo(int index) {
    setState(() {
      todos.removeAt(index);
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
      body: todos.isNotEmpty
          ? ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return ToDoTile(
                    todoTitle: todos[index]['todoTitle'],
                    isChecked: todos[index]['isChecked'],
                    onChanged: (val) => onChanged(val!, index),
                    deleteTodo: (context) => deleteTodo(index));
              },
            )
          : const Center(
              child:
                  Text("No todos yet, Click the + button to add a new todo")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {onAddTodo()},
        backgroundColor: Colors.blueGrey,
        elevation: 0,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
