// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:note_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // variables
  List toDoList = [
    ["Learn tutorial", false],
    ["Do Exercise", false],
    ["Clean house", false],
    ["Dog Walking", false],
    ["Hang out", false],
  ];

  // methods
  void checkboxChanged(bool? value, index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
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
        body: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, index) {
            return TodoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) {
                  checkboxChanged(value, index);
                });
          },
        ));
  }
}
