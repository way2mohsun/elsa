import 'package:flutter/material.dart';
import 'package:flutterapp/todoey/modules/task_list.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  Function addTaskCallBack;

  AddTaskScreen({this.addTaskCallBack});

  @override
  Widget build(BuildContext context) {
    String newTaskTitle;
    return Container(
      color: Color(0xff757575), // Color.fromRGBO(117, 117, 117, 1.0),
      child: Container(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Add Task',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlueAccent,
              ),
            ),
            SizedBox(height: 10.0),
            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (newText) {
                newTaskTitle = newText;
              },
            ),
            SizedBox(height: 30.0),
            FlatButton(
              color: Colors.lightBlueAccent,
              onPressed: () {
                context.read<TaskList>().add(name: newTaskTitle);
                Navigator.pop(context);
              },
              child: Text('Add'),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
      ),
    );
  }
}
