import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  final String  property,propertyvalue;
  const CardInfo({super.key, required this.property, required this.propertyvalue,});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10, top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.black),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(property),
        TextField(
            decoration: InputDecoration(
          focusedBorder: InputBorder.none,
          hintText: propertyvalue,
          disabledBorder: InputBorder.none,
        ))
      ]),
    );
  }
}
