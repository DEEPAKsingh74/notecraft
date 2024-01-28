import 'package:flutter/material.dart';

class CustomButtom extends StatelessWidget {
  final String title;
  final VoidCallback callback;
  const CustomButtom({super.key, required this.title, required this.callback});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.amber,
      ),
      onPressed: callback,
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 19,
        ),
      ),
    );
  }
}
