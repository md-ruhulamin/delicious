// ignore_for_file: prefer_const_constructors

import 'package:eshop/utils/color.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class TextFieldForCheckout extends StatelessWidget {
  final String text;
  TextFieldForCheckout({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: TextFormField(
          // decoration: InputDecoration(

          //   border: OutlineInputBorder(

          //   ),
          //   hintText: text),

          decoration: InputDecoration(
            labelText: text,
            labelStyle: TextStyle(color: Colors.grey),
            // enabledBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.red),
            // ),
            border: OutlineInputBorder(
borderSide: BorderSide()

            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.amber
              )
            )
            // focusedBorder: UnderlineInputBorder(
            //   borderSide: BorderSide(color: Colors.blue),
            // ),
          ),
        ));
  }
}
