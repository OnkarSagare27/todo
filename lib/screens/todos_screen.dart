import 'package:flutter/material.dart';

class TodosScren extends StatefulWidget {
  const TodosScren({super.key});

  @override
  State<TodosScren> createState() => _TodosScrenState();
}

class _TodosScrenState extends State<TodosScren> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Todo',
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
