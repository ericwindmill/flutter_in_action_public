import 'package:shared/shared.dart';

void main() {
  var service = WebHttp();
  var controller = TodoController(service);

  runApp(controller);
}

runApp(TodoController controller) async {
  List<Todo> todos = await controller.services.getTodos();

  todos.forEach((Todo t) => print(t.toString()));
}
