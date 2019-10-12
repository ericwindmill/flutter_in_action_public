import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:shared/shared.dart';

class MockClient extends Mock implements Client {}

Future<List<Todo>> getTodos(Client client) async {
  final response =
      await client.get('https://jsonplaceholder.typicode.com/todos');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON
    var all = AllTodos.fromJson(json.decode(response.body));
    return all.todos;
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load todos');
  }
}

void main() {
  group('getTodos', () {
    test('returns a list of todos if the http call completes', () async {
      final client = MockClient();

      // Use Mockito to return a successful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/todos'))
          .thenAnswer((_) async => Response('[]', 200));

      expect(await getTodos(client), isInstanceOf<List<Todo>>());
    });

    test('throws an exception if the http call completes with an error', () {
      final client = MockClient();

      // Use Mockito to return an unsuccessful response when it calls the
      // provided http.Client.
      when(client.get('https://jsonplaceholder.typicode.com/todos'))
          .thenAnswer((_) async => Response('Not Found', 404));

      expect(getTodos(client), throwsException);
    });
  });
}
