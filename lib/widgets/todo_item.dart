import 'package:flutter/material.dart';
import 'package:todoapp/constants/colors.dart';
import 'package:todoapp/models/todo.dart';

class ToDoItem extends StatelessWidget{
 

  const ToDoItem({
    super.key,
    required this.toDo,
    required this.onChangeItem,
    required this.onDeleteItem, required void Function(String id, String newTitle) onUpdateItem,

  });

  final ToDo toDo;
  final onChangeItem;
  final onDeleteItem;

@override
  Widget build(BuildContext context){
  
   return Container(
    margin: const EdgeInsets.all(5.0),
    child: ListTile(
      onTap: (){
      onChangeItem(toDo);
      },

      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)
      ),
      tileColor: toDo.isDone==1 ? bgGreen : bgRed,

      leading: Container(
        child: Icon(
          toDo.isDone== 1 ? Icons.check_box : Icons.unpublished_rounded,
          color: textBlack,
          
        ),
      ),

      title: Text(
        toDo.title,
        style: const TextStyle(
          color: textBlack,
          fontSize: 20.0,
          fontWeight: FontWeight.bold
        ),
      ),

      trailing:Container(
        child: IconButton(
          color: textBlack,
          icon:const Icon(
            Icons.delete,
           size:20.0,
            ),

            onPressed: (){
              onDeleteItem(toDo.id);
            },
        ),

      ),
    ),

   );
}

  icon(IconData delete) {}


}