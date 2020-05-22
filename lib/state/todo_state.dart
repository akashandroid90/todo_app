import 'package:todoapp/contstants/app_constants.dart';
import 'package:todoapp/model/todo.dart';

class TodoState {
  List<Todo> todoList;
  bool isLoading;
  String errorMessage;

  TodoState({this.todoList = AppConstants.list,
    this.errorMessage = "",
    this.isLoading = false});
}
