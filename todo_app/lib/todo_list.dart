import 'package:flutter/material.dart';
import 'package:todo_app/models/todo.dart';

class TodoList extends StatefulWidget {
  
  final List<Todo> todoItems;
  TodoList(this.todoItems);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ListView size
      itemCount: this.widget.todoItems.length,
      // Function to defin how build list view
      itemBuilder: (context, index) {
        Todo todo = this.widget.todoItems[index];
        return Card(
          child: Row(
            children: <Widget>[
              Expanded(
                child: ListTile(
                  title: Text(todo.title),
                  subtitle: Text(todo.addedAt.toString()),
                )
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.check), 
                    color: Colors.green,
                    onPressed: todo.realised,
                    splashColor: Colors.green,
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.delete),
                    color: Colors.red,
                    onPressed: todo.remove,
                    splashColor: Colors.red,
                  )
                ]
              )
            ],
          ),
        );
      },
    );
  }
}
