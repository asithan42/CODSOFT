import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/models/todo.dart';
import 'package:todoapp/screens/update.dart';
import 'package:todoapp/widgets/todo_item.dart';


class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _toDoController = TextEditingController();
  final tasks = ToDo.todoList();
  String errorMessage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgfbBlue,
      appBar: _appbarWidget(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
            child: const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: Text(
                  "To Do List",
                  style: TextStyle(color: textBlack, fontSize: 40.0, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
         Expanded(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) => GestureDetector(
            onLongPress: () {
              _onLongPressTask(tasks[index]);
            },
            child: ToDoItem(
              toDo: tasks[index],
              onChangeItem: _onChangeItem,
              onDeleteItem: onDeleteItem,
              onUpdateItem: (id, newTitle) {
                _onUpdateTask(id, newTitle);
              },
            ),
          ),
        ),
      ),


          Container(
            margin: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _toDoController,
                    decoration: InputDecoration(
                      hintText: "Add New Task",
                      hintStyle: const TextStyle(
                        color: textBlueL,
                      ),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      errorText: errorMessage,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 20.0,bottom: 20),
                  child: FloatingActionButton(
                    backgroundColor: bgGreen,
                    onPressed: () {
                      _onAddItem(_toDoController.text);
                    },
                    child: const Icon(
                      Icons.add,
                      color: textBlueL,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  AppBar _appbarWidget() {
    return AppBar(
      backgroundColor: textBlueL,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: textWhite,
            size: 40,
          ),
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(('assest/images/profile-pic.png')),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onChangeItem(ToDo toDo) {
  setState(() {
    int index = tasks.indexWhere((element) => element.id == toDo.id);
 
    if (index != -1) {
      tasks[index].isDone = 1 - tasks[index].isDone;
    }
  });
}

  void onDeleteItem(String id) {
    setState(() {
      tasks.removeWhere((element) => element.id == id);
    });
  }

  void _onAddItem(String title) {
    if (title.isNotEmpty) {
      setState(() {
        tasks.add(ToDo(id: DateTime.now().millisecondsSinceEpoch.toString(), title: title, isDone: 0));
        errorMessage = ''; // Clear error message if title is not empty
      });
      _toDoController.clear();
    } else {
      setState(() {
        errorMessage = 'Please enter a task';
      });
    }
  }

void _onLongPressTask(ToDo toDo) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          // Customize the appearance of the bottom sheet as needed
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.edit),
                title: const Text('Update Task'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  _showUpdateScreen(toDo);
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete),
                title: const Text('Delete Task'),
                onTap: () {
                  Navigator.pop(context); // Close the bottom sheet
                  onDeleteItem(toDo.id);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _showUpdateScreen(ToDo toDo) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => UpdateScreen(
          toDo: toDo,
          onUpdateItem: _onUpdateItem,
        ),
      ),
    );
  }

  void _onUpdateItem(String id, String newTitle) {
    setState(() {
      int index = tasks.indexWhere((element) => element.id == id);

      if (index != -1) {
        tasks[index].title = newTitle;
      }
    });
  }




}

class _onUpdateTask {
  _onUpdateTask(String id, String newTitle);
}