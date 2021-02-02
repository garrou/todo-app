import 'package:firebase_database/firebase_database.dart';

class Todo {
  DatabaseReference _id;
  String title;
  String addedAt;
  bool removed = false;
  bool done = false;

  // Constructor
  Todo(this.title, this.addedAt);

  // Set an id to a post
  void setId(DatabaseReference id) {
    this._id = id;
  }

  // Get the id of the todo
  DatabaseReference getId() {
    return this._id;
  }

  // Parse todo in json object
  Map<String, String> toJson() {
    return {'title': this.title, 'addedAt': this.addedAt};
  }
}

// Convert a database record to a Todo object
Todo createTodo(record) {
  Map<String, String> attributes = {'title': '', 'addedAt': ''};

  record.forEach((key, value) => {attributes[key] = value});

  return new Todo(attributes['title'], attributes['addedAt']);
}
