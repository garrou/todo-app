import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/add_todo.dart';
import 'package:todo_app/auth.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/login.dart';
import 'package:todo_app/models/todo.dart';
import 'package:todo_app/todo_list.dart';

class HomePage extends StatefulWidget {
  final User user;
  HomePage(this.user);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Todo> _thingsTodo = [];

  // Get saved tasks
  void update() {
    getAllTasks().then((tasks) => {
          this.setState(() {
            this._thingsTodo = tasks;
          })
        });
  }

  // Disconnect and go to login
  void disconectGoToLogin() {
    signInWithGoogle();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

  // Go to add page on button press
  void goToAddPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddTodo(widget.user)));
  }

  // At init, get tasks
  @override
  void initState() {
    super.initState();
    this.update();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TODO'),
          actions: [
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: IconButton(
                    icon: Icon(Icons.logout),
                    tooltip: 'Logout',
                    onPressed: disconectGoToLogin,
                    splashColor: Colors.blue))
          ],
        ),
        body: Column(children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              child: Text(widget.user.displayName + '\'s todo',
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      fontWeight: FontWeight.bold))),
          Expanded(child: TodoList(this._thingsTodo)),
          Container(
              margin: EdgeInsets.all(20),
              child: FloatingActionButton.extended(
                  onPressed: goToAddPage,
                  label: const Text('Add a task'),
                  icon: Icon(Icons.add),
                  backgroundColor: Colors.blue))
        ]));
  }
}
