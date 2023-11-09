// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String text;
  const RoundButton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
    
      height: 55,
     
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.amber,
      ),
      alignment: Alignment.center,
      child: Text(
       text,
        style: TextStyle(
            color: Colors.white, fontSize: 16, fontFamily: 'WorkSansSemiBold',fontWeight: FontWeight.bold),
      ),
    );
  }
}
