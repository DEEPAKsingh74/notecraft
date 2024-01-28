import 'package:flutter/material.dart';

class TodoCard extends StatelessWidget {
  final int index;
  const TodoCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return const Card(
      child: Column(
        children: [
          Text(
            "Head lines",
            style: TextStyle(
              fontSize: 20,
              color: Color.fromARGB(255, 62, 62, 62),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Todo of the data",
          ),
        ],
      ),
    );
  }
}
