import 'package:flutter/material.dart';

class BottomItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback callback;
  const BottomItem(
      {super.key,
      required this.title,
      required this.icon,
      required this.isSelected,
      required this.callback});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: callback,
      icon: (isSelected)
          ? Column(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.amber,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.amber,
                  ),
                )
              ],
            )
          : Column(
              children: [
                Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                )
              ],
            ),
    );
  }
}
