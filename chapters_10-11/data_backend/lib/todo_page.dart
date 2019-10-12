
import 'package:flutter/material.dart';
import 'package:shared/shared.dart';

class TodoPage extends StatefulWidget {
  final TodoController controller;

  const TodoPage({Key key, this.controller}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> todos;
  bool isLoading = false;

  void _getTodos() async {
    var newTodos = await widget.controller.fetchTodos();
    setState(() {
      todos = newTodos;
    });
  }

  void updateTodo(Todo todoItem, bool isCompleted) async {
    await widget.controller.updateTodo(todoItem, isCompleted);
    setState(() {});
  }

  void initState() {
    super.initState();
    widget.controller.onSync.listen((bool syncState) => setState(() {
          isLoading = syncState;
        }));
  }

  Widget get body => isLoading
      ? CircularProgressIndicator()
      : ListView.builder(
          key: Key('list-view'),
          itemCount: todos != null ? todos.length : 1,
          itemBuilder: (ctx, idx) {
            if (todos != null) {
              return CheckboxListTile(
                key: ValueKey("todo-$idx"),
                onChanged: (bool val) => updateTodo(todos[idx], val),
                value: todos[idx].completed,
                title: Text(todos[idx].title),
                subtitle: Text(
                  "todo num: $idx",
                  key: ValueKey("todo-$idx-subtitle"),
                ),
              );
            } else {
              return Text("Tap button to fetch todos");
            }
          });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HTTP Todos'),
        actions: <Widget>[
          Container(
            child: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Text(
                widget.controller.getCompletedTodos().toString(),
                key: ValueKey("counter"),
                style: Theme.of(context).textTheme.display2,
              ),
            ),
          ),
        ],
      ),
      body: Center(child: body),
      floatingActionButton: FloatingActionButton(
        key: Key("get-todos-button"),
        onPressed: () => _getTodos(),
        child: Icon(Icons.add),
      ),
    );
  }
}
