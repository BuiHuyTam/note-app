import 'package:flutter/material.dart';
import 'package:note_app/utils/my_button.dart';

class DialogBox extends StatelessWidget {
  DialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task ..."),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Save button
                MyButton(text: "Save", onPressed: onSave),
                const SizedBox(
                  width: 8,
                ),
                // Cancel button
                MyButton(text: "Cancel", onPressed: onCancel)
              ],
            )
          ],
        ),
      ),
    );
  }
}
