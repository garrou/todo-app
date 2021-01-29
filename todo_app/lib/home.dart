import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/textfield_todo.dart';
import 'package:todo_app/todo_list.dart';

class HomePage extends StatefulWidget {

  final User user;
  HomePage(this.user);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Todo> _thingsTodo = [];

  void newTodo(String text) {
    Todo toAdd = new Todo(text, widget.user.displayName, DateFormat('dd/MM/yyyy').format(DateTime.now()));
    toAdd.setId(saveTodo(toAdd));
    setState(() {
      this._thingsTodo.add(toAdd);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TODO'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(20),
            child: Text(widget.user.displayName + '\'s todo',
              style: TextStyle(
                color: Colors.green,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )
            ),
          ),
          Expanded(child: TodoList(this._thingsTodo)),
          Expanded(child: TextFieldTodo(this.newTodo)),
        ],
      ) 
    );
  }
}
