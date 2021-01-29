import 'package:firebase_database/firebase_database.dart';

class Todo {

  DatabaseReference _id;
  String title;
  String details;
  String addedAt;
  bool removed = false;
  bool done = false;

  Todo(this.title, this.details, this.addedAt);

  void remove() {
    this.removed = true;
  }

  void realised() {
    this.done = true;
  }

  void setId(DatabaseReference id) {
    this._id = id;
  }

  Map<String, String> toJson() {
    return {
      'title': this.title,
      'details': this.details,
      'addedAt': this.addedAt
    };
  }
}