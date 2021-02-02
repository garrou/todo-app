import 'package:firebase_database/firebase_database.dart';
import 'package:todo_app/models/todo.dart';

// Reference to our database
final databaseReference = FirebaseDatabase.instance.reference();

// Insert task in database
DatabaseReference saveTodo(Todo todo) {
  // Every time we add a new entry we give to add a unique id
  DatabaseReference id = databaseReference.child('todos/').push();
  // Json serializable object
  id.set(todo.toJson());

  return id;
}

// Retrieve all tasks from database
Future<List<Todo>> getAllTasks() async {
  DataSnapshot dataSnapshot = await databaseReference.child('todos/').once();
  List<Todo> tasks = [];

  if (dataSnapshot.value != null) {
    dataSnapshot.value.forEach((key, value) {
      Todo todo = createTodo(value);
      todo.setId(databaseReference.child('posts/' + key));
      tasks.add(todo);
    });
  }

  return tasks;
}

// Delete from database where todo id == id
void deleteTask(DatabaseReference id) async {
  await databaseReference.child('todos').child(id.key).remove();
}
