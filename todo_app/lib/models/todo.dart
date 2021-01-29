class Todo {
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
}