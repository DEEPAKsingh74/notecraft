import 'package:flutter/material.dart';

class ProfileTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData prefixIcon;
  const ProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        prefixIcon,
        color: const Color.fromARGB(255, 237, 178, 0),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(subtitle),
    );
  }
}
