import 'package:flutter/material.dart';

class TextFieldTodo extends StatefulWidget {
  final Function(String) callback;
  TextFieldTodo(this.callback);

  @override
  _TextFieldTodoState createState() => _TextFieldTodoState();
}

class _TextFieldTodoState extends State<TextFieldTodo> {
  final _controller = TextEditingController();

  void save() {
    FocusScope.of(context).unfocus();
    widget.callback(this._controller.text);
    this._controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 50),
        child: TextField(
            controller: this._controller,
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.edit),
                labelText: 'Type a task todo',
                suffixIcon: IconButton(
                  icon: Icon(Icons.save),
                  onPressed: this.save,
                  tooltip: 'Press to save task',
                  splashColor: Colors.green,
                ))));
  }
}
