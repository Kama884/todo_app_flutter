import '../models/task_model.dart';

class TodoController {
  List<Task> tasks = [];

  //add task
  void addTask(String title) {
    if (title.isEmpty) return;
    tasks.add(Task(title: title));
  }

  //delete task
  void deleteTask(int index) {
    if (index < 0 || index >= tasks.length) return;
    tasks.removeAt(index);
  }

  void toggleTaskStatus(int index) {
    if (index < 0 || index >= tasks.length) return;
    tasks[index].iscompleted = !tasks[index].iscompleted;
  }
}
