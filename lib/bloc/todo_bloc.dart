import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:todoapp/model/todo.dart';
import 'package:todoapp/state/todo_state.dart';

class TodoBloc extends Bloc<List<Todo>, TodoState> {
  @override
  // TODO: implement initialState
  TodoState get initialState => TodoState([]);

  @override
  Stream<TodoState> mapEventToState(List<Todo> event) async* {
    yield TodoState(event);
  }

  void loadData() {
    http.post("url").then((value) => add(json.decode(value.body)));
  }
}
