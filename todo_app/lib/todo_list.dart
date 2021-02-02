import 'package:flutter/material.dart';
import 'package:todo_app/database.dart';
import 'package:todo_app/models/todo.dart';

class TodoList extends StatefulWidget {
  final List<Todo> tasks;
  TodoList(this.tasks);
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  // Delete task
  void delete(int index) {
    Todo toRemove = widget.tasks[index];
    widget.tasks.removeAt(index);
    deleteTask(toRemove.getId());
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // ListView size
        itemCount: widget.tasks.length,
        // Function to defin how build list view
        itemBuilder: (BuildContext context, int index) {
          Todo todo = widget.tasks[index];
          return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              onDismissed: (_) {
                delete(index);
              },
              child: Card(
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    title: Text(todo.title),
                    subtitle: Text(todo.addedAt.toString()),
                  )),
              background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  child: Container(
                      margin: EdgeInsets.only(right: 20),
                      child: Icon(Icons.delete, color: Colors.white))));
        });
  }
}
