// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class TwoText extends StatelessWidget {
 final String text1, text2;
  const TwoText({super.key, required this.text1, required this.text2});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(text1,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            )),
        Text(text2,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black,
            )),
      ],
    );
  }
}
