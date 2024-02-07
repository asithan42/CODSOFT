
class ToDo{
  String id;
  String title;
  int isDone;


ToDo({
  required this.id,
  required this.title,
  this.isDone=0,
});

static List<ToDo> todoList(){
  return [
    ToDo(
      id: "1",
      title: "Add your tasks",
      isDone: 1,
      ), 

  ];

  }
}