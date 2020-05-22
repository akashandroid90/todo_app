import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/contstants/app_constants.dart';
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/state/todo_state.dart';

class TodoBloc extends Bloc<dynamic, TodoState> {
  @override
  TodoState get initialState => TodoState();

  @override
  Stream<TodoState> mapEventToState(dynamic event) async* {
    if (event is bool)
      yield TodoState(isLoading: event);
    else if (event is String)
      yield TodoState(
          todoList: AppConstants.list, errorMessage: event, isLoading: false);
    else if (event is List) yield TodoState(todoList: event, isLoading: false);
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    if (error is SocketException)
      add("Network Issue! \nTry again later");
    else
      add("Try again later");
    super.onError(error, stackTrace);
  }

  void loadData() {
    add(true);
    http
        .get(AppConstants.base_url + "todos")
//        .catchError(onError)
        .then((value) => json.decode(value.body) as List)
        .then(
            (value) => value.map<Todo>((data) => Todo.fromJson(data)).toList())
        .then((value) => add(value))
        .catchError(onError);
  }
}
