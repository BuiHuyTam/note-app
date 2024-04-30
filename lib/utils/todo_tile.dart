// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged});

  // variables
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;

  // methods

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
      child: Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
            color: Colors.yellow, borderRadius: BorderRadius.circular(12)),
        child: Row(
          children: [
            // Checkbox
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              checkColor: Colors.white,
              activeColor: Colors.black,
            ),
            // Task name
            Text(
              taskName,
              style: TextStyle(
                  decoration: taskCompleted
                      ? TextDecoration.lineThrough
                      : TextDecoration.none),
            ),
          ],
        ),
      ),
    );
  }
}
