// update.dart

import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/models/todo.dart';

class UpdateScreen extends StatefulWidget {
  final ToDo toDo;
  final Function(String, String) onUpdateItem;

  const UpdateScreen({
    Key? key,
    required this.toDo,
    required this.onUpdateItem,
  }) : super(key: key);

  @override
  _UpdateScreenState createState() => _UpdateScreenState();
}

class _UpdateScreenState extends State<UpdateScreen> {
  final _updateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _updateController.text = widget.toDo.title;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgfbBlue,
      appBar: AppBar(
        title: const Text('Update Task', style: TextStyle(color: textWhite, fontWeight: FontWeight.bold, fontSize: 30)),
        backgroundColor: textBlueL,
        iconTheme: IconThemeData(color: textWhite),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                TextField(
                  controller: _updateController,
                  decoration: const InputDecoration(
                    hintText: 'Update Task',
                    contentPadding: EdgeInsets.all(15.0), // Adjust content padding
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: bgGreen,
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      widget.onUpdateItem(widget.toDo.id, _updateController.text);
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bgGreen,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: const Text(
                      'Update',
                      style: TextStyle(
                        color: textBlack,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Image.asset('assest/images/update.png', height: 500, width: 500),
                ),
                const SizedBox(
                  height: 20.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
