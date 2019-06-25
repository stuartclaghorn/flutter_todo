import 'package:flutter/material.dart';
import 'package:flutter_todo/utils/dbhelper.dart';
import 'package:flutter_todo/models/todo.dart';

class TodoList extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TodoListState();
}

class TodoListState extends State<TodoList> {
  DbHelper helper = DbHelper();
  List<Todo> todos;
  int count = 0;

  @override
  Widget build(BuildContext context) {
    if (todos == null) {
      todos = List<Todo>();
      getData();
    }
    return Scaffold(
      body: todoListItems(),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: "Add New Item",
        child: Icon(Icons.add),
      ),
    );
  }

  ListView todoListItems() {
    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.red,
              child: Text(this.todos[position].id.toString()),
            ),
            title: Text(this.todos[position].title),
            subtitle: Text(this.todos[position].date),
            onTap: () {
              debugPrint("Tapped on ${this.todos[position].id.toString()}");
            },
          ),
        );
      },
    );
  }

  void getData() {
    // Initial insert for test
//    DateTime today = DateTime.now();
    final dbFuture = helper.initializeDb();
    dbFuture.then((result) {
//      Todo todo = Todo(
//          "Buy Apples", 3, today.toString(), "And make sure they are good");
//      helper.insertTodo(todo);
      final todosFuture = helper.getTodos();
      todosFuture.then((result) {
        List<Todo> todoList = List<Todo>();
        count = result.length;
        for (int i = 0; i < count; i++) {
          todoList.add(Todo.fromObject(result[i]));
          debugPrint(todoList[i].title);
        }
        setState(() {
          todos = todoList;
          count = count;
          debugPrint("Items " + count.toString());
        });
      });
    });
  }
}
