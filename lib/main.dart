import 'package:flutter/material.dart';
import 'package:todoapp/model/todo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Todo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Todo> _todoList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: _todoList.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              color: Colors.white,
              elevation: 2.0,
              child: ListTile(
                leading: CircleAvatar(
                  child: Text("A"),
                ),
                title: Text(_todoList[index].title),
                subtitle: Text(_todoList[index].description),
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          setState(() {
            _todoList.add(Todo(
                "ABC " + _todoList.length.toString(), "description", true));
          })
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
