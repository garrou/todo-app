import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/textfield_todo.dart';

class AddTodo extends StatefulWidget {
  final User user;
  AddTodo(this.user);
  @override
  _AddTodoState createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  // Add task in database
  void addTodo(String text) {
    Todo toAdd = new Todo(text, widget.user.displayName,
        DateFormat('dd/MM/yyyy').format(DateTime.now()));
    toAdd.setId(saveTodo(toAdd));
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => HomePage(widget.user)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Add a task'),
        ),
        body: Column(
            children: <Widget>[Expanded(child: TextFieldTodo(this.addTodo))]));
  }
}
