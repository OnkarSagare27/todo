import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/universal_provider.dart';

class TodosScren extends StatefulWidget {
  const TodosScren({super.key});

  @override
  State<TodosScren> createState() => _TodosScrenState();
}

class _TodosScrenState extends State<TodosScren> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UniversalProvider>(
      builder: (context, universalProvider, child) =>
          universalProvider.dataModel == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ))
              : Scaffold(
                  floatingActionButton: FloatingActionButton(
                    backgroundColor: Colors.deepPurple,
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    onPressed: () {},
                  ),
                ),
    );
  }
}
