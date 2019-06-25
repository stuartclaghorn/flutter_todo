import 'package:flutter/material.dart';
//import 'package:flutter_todo/utils/dbhelper.dart';
//import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/screens/todolist.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
//    List<Todo> todos = List<Todo>();
//    DbHelper helper = DbHelper();
//    helper
//        .initializeDb()
//        .then((result) => helper.getTodos().then((result) => todos = result));
//    DateTime today = DateTime.now();
//    Todo todo =
//        Todo("Buy Melons", 1, today.toString(), "And make sure they are good");
//    helper.insertTodo(todo);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: MyHomePage(title: 'To Dos Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: TodoList(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
