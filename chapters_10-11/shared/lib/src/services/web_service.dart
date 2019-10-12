import 'dart:convert';

import 'package:http/http.dart';
import 'package:shared/shared.dart';

class WebHttp implements Services {
  Client client = Client();

  @override
  Future addTodo() {
    // TODO: implement addTodo
    return null;
  }

  @override
  Future<List<Todo>> getTodos() async {
    final response = await client.get('https://jsonplaceholder.typicode.com/todos?userId=1');

    if (response.statusCode == 200) {
      var all = AllTodos.fromJson(json.decode(response.body));
      return all.todos;
    } else {
      throw Exception('Failed to load todos ');
    }
  }

  @override
  Future<Todo> updateTodo(Todo todo) {
    // TODO: implement updateTodo
    return null;
  }
}
