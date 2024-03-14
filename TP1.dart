import 'dart:async';

class Task {
  String _name;
  bool _isCompleted;

  Task(this._name, this._isCompleted);

  String get name => _name;

  bool get isCompleted => _isCompleted;

  set isCompleted(bool value) {
    _isCompleted = value;
  }
}

class TaskManager {
  List<Task> _tasks = [];

  void addTask(Task task) {
    _tasks.add(task);
  }

  void removeTask(Task task) {
    _tasks.remove(task);
  }

  void completeTask(Task task) {
    task.isCompleted = true;
  }

  List<Task> get tasks => _tasks;

  Future<void> printTasks() async {
    print('Printing tasks...');
    await Future.delayed(Duration(seconds: 1));
    if (_tasks.isEmpty) {
      print('No tasks available');
    } else {
      for (var task in _tasks) {
        print('${task.name} - ${task.isCompleted ? "Completed" : "Pending"}');
      }
    }
  }
}

void main() async {
  var taskManager = TaskManager();

  taskManager.addTask(Task('Write report', false));
  taskManager.addTask(Task('Prepare presentation', false));
  taskManager.addTask(Task('Send emails', false));

  await taskManager.printTasks();

  print('Completing task...');
  taskManager.completeTask(taskManager.tasks[0]);

  await taskManager.printTasks();
}

