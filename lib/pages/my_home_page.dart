import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/pages/todo_list.dart';
import 'package:todoapp/state/todo_state.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    BlocProvider.of<TodoBloc>(context).loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: BlocBuilder(
        bloc: BlocProvider.of<TodoBloc>(context),
        builder: (BuildContext context, TodoState state) {
          return state.isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : state.errorMessage.length > 0
                  ? Center(
                      child: Text(
                        state.errorMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 40.0, fontWeight: FontWeight.bold),
                      ),
                    )
                  : TodoList();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {BlocProvider.of<TodoBloc>(context).loadData()},
        tooltip: 'Refresh',
        child: Icon(Icons.refresh),
      ),
    );
  }

  @override
  void dispose() {
    BlocProvider.of<TodoBloc>(context).close();
    super.dispose();
  }
}
