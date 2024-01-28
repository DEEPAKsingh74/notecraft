import 'package:flutter/material.dart';

class PagerIndicator extends StatefulWidget {
  final bool isActive;
  const PagerIndicator({super.key, required this.isActive});

  @override
  State<PagerIndicator> createState() => _PagerIndicatorState();
}

class _PagerIndicatorState extends State<PagerIndicator> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 6),
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10.0),
        ),
        color: (widget.isActive)
            ? Colors.amber
            : const Color.fromARGB(255, 192, 192, 192),
      ),
    );
  }
}
