import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppIcon extends StatelessWidget {
  final String text;
  Color iconcolor = Colors.red;
  IconData icon;
  AppIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(
            icon,
            size: 26,
            color: iconcolor,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
