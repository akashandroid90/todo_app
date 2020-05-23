import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todoapp/bloc/todo_bloc.dart';
import 'package:todoapp/state/todo_state.dart';
import 'package:todoapp/widgets/todo_list.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = TodoBloc();

  @override
  void initState() {
    _bloc.loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _bloc,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: BlocBuilder(
          bloc: _bloc,
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
          onPressed: () => {_bloc.loadData()},
          tooltip: 'Refresh',
          child: Icon(Icons.refresh),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}
