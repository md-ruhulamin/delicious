// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TopTitles extends StatelessWidget {
  final String title;
  final String subtitle;
  const TopTitles({
    Key? key,
    required this.title,
    required this.subtitle,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          height: kTextTabBarHeight + 12,
        ),
        if (title == 'Login' || title == 'Create Account')
          GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Icon(Icons.arrow_back_ios)),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
      ],
    );
  }
}
