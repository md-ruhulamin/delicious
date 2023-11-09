
import 'package:flutter/material.dart';

class CheckOutProgressCircle extends StatelessWidget {
  final Color color;
   CheckOutProgressCircle({super.key, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            )),
      ),
    );
  }
}
