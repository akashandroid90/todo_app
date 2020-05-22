import 'package:todoapp/model/todo.dart';

class TodoState {
  final List<Todo> _todoList;

  TodoState(this._todoList);

  List<Todo> get todoList {
    return List.from(_todoList);
  }
}
