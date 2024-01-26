import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/universal_provider.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<UniversalProvider>(
      builder: (context, universalProvider, child) =>
          universalProvider.dataModel == null
              ? const Center(
                  child: CircularProgressIndicator(
                  color: Colors.deepPurple,
                ))
              : const Scaffold(),
    );
  }
}
