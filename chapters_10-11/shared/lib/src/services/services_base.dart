import '../todo_model.dart';

abstract class Services {
  Future<List<Todo>> getTodos();

  Future<Todo> updateTodo(Todo todo);

  Future addTodo();
}

class MockServices implements Services {
  @override
  Future addTodo() {
    // TODO: implement addTodo
    return null;
  }

  @override
  Future<List<Todo>> getTodos() async {
    return [
      Todo(1, 1, "delectus aut autem", false),
      Todo(1, 2, "quis ut nam facilis et officia qui", false),
      Todo(1, 3, "fugiat veniam minus", false),
      Todo(1, 4, "et porro tempora", true),
      Todo(1, 8, "et porro tempora", true),
      Todo(1, 9, "et porro tempora", true),
      Todo(1, 10, "et porro tempora", true),
      Todo(1, 11, "et porro tempora", true),
      Todo(1, 12, "et porro tempora", true),
      Todo(1, 13, "et porro tempora", true),
      Todo(1, 14, "et porro tempora", true),
      Todo(1, 15, "et porro tempora", true),
      Todo(1, 16, "et porro tempora", true),
    ];
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    return null;
  }
}
