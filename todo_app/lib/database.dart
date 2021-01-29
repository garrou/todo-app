import 'package:firebase_database/firebase_database.dart';
import 'package:todo_app/models/todo.dart';

// Reference to our database
final databaseReference = FirebaseDatabase.instance.reference();

DatabaseReference saveTodo(Todo todo) {
  // Every time we add a new entry we give to add a unique id
  DatabaseReference id = databaseReference.child('todos/').push();
  // Json serializable object
  id.set(todo.toJson());
  
  return id;
}