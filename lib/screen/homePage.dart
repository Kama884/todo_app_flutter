import 'package:flutter/material.dart';
import '../controllers/todo_controller.dart';
import '../widgets/task_tile.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  final TodoController _todoController = TodoController();
  final TextEditingController _textEditingController = TextEditingController();

  void _showaddTaskDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add new Task'),
        content: TextField(
          controller: _textEditingController,
          decoration: const InputDecoration(hintText: 'Enter task title'),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (_textEditingController.text.isNotEmpty) {
                setState(() {
                  _todoController.addTask(_textEditingController.text);
                });
                _textEditingController.clear();
              }

              Navigator.of(context).pop();
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      body: ListView.builder(
        itemCount: _todoController.tasks.length,
        itemBuilder: (context, index) {
          return TaskTile(
            task: _todoController.tasks[index],
            onDelete: () {
              setState(() {
                _todoController.deleteTask(index);
              });
            },
            onToggle: () {
              setState(() {
                _todoController.toggleTaskStatus(index);
              });
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showaddTaskDialog,
        child: const Icon(Icons.add),
      ),
    );
  }
}
