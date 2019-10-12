import 'dart:async';

import 'package:shared/src/services/services_base.dart';
import 'package:shared/src/todo_model.dart';

class TodoController {
  final Services services;
  List<Todo> todos;
  var counter = CompletedTodoCounter();

  StreamController<bool> onSyncController = StreamController();

  Stream<bool> get onSync => onSyncController.stream;

  TodoController(this.services);

  Future<List<Todo>> fetchTodos() async {
    counter.resetCounter();
    onSyncController.add(true);
    todos = await services.getTodos();
    onSyncController.add(false);
    return todos;
  }

  Future<Todo> updateTodo(Todo todo, bool isCompleted) async {
    todo.completed = isCompleted;
    return await services.updateTodo(todo);
  }

  int getCompletedTodos() {
    counter.resetCounter();
    todos?.forEach((Todo t) {
      if (t.completed) {
        counter.increaseCounter();
      }
    });
    return counter.completed;
  }
}

class CompletedTodoCounter {
  int completed = 0;

  void increaseCounter() => completed++;

  void decreaseCounter() => completed--;

  void resetCounter() => completed = 0;
}
