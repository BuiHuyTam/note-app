// ignore_for_file: use_super_parameters

import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  MyButton({super.key, required this.text, required this.onPressed});

  final String text;

  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 40,
      onPressed: onPressed,
      child: Text(text),
      color: Colors.yellow,
    );
  }
}
