import 'package:flutter/material.dart';

class ColabScreen extends StatefulWidget {
  const ColabScreen({super.key});

  @override
  State<ColabScreen> createState() => _ColabScreenState();
}

class _ColabScreenState extends State<ColabScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Collab screen"),
    );
  }
}