import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];
  // reference the hive box
  final _myBox = Hive.box('mybox');

  // run this method if it is the 1st time open the app
  void createInitialize() {
    toDoList = [
      ["Wash dishes", false],
      ["Do homework", false]
    ];
  }

  // load data from database
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  // update data
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
  // delete data
}
