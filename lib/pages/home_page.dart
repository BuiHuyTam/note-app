// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note_app/data/database.dart';
import 'package:note_app/utils/dialog_box.dart';
import 'package:note_app/utils/todo_tile.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');

  // create instances
  ToDoDatabase db = ToDoDatabase();

  @override
  void initState() {
    // if this is the 1st time opening the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialize();
    } else {
      db.loadData();
    }
  }

  // variables
  final _controller = TextEditingController();

  // methods
  void checkboxChanged(bool? value, index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    _controller.clear();
    db.updateData();
    Navigator.of(context).pop();
  }

  void cancelNewTask() {
    Navigator.of(context).pop();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: cancelNewTask,
          );
        });
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[200],
        appBar: AppBar(
          backgroundColor: Colors.yellow,
          centerTitle: true,
          title: Text(
            "TO DO",
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          elevation: 0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: createNewTask,
          backgroundColor: Colors.yellow,
          child: Icon(Icons.add),
        ),
        body: ListView.builder(
          itemCount: db.toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
              taskName: db.toDoList[index][0],
              taskCompleted: db.toDoList[index][1],
              onChanged: (value) {
                checkboxChanged(value, index);
              },
              deleteFunction: (context) => deleteTask(index),
            );
          },
        ));
  }
}
