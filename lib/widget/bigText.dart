// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final double? size;
  final String text;
  Color? color = Colors.black;
  BigText({super.key, required this.text, this.color,  this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          fontSize:size, color: color, fontFamily: 'WorkSansSemiBold'),
    );
  }
}
