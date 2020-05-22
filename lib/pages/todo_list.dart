import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/todo_bloc.dart';

class TodoList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final todoList = BlocProvider.of<TodoBloc>(context).state.todoList;
    return ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(
            color: Colors.white,
            elevation: 2.0,
            child: ListTile(
              leading: CircleAvatar(
                child: Text("A"),
              ),
              title: Text(todoList[index].title),
              subtitle: Text(todoList[index].description),
            ),
          );
        });
  }
}
