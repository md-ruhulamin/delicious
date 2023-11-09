import 'package:flutter/material.dart';

class PaymentContainer extends StatelessWidget {
  final String text;
   PaymentContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, right: 5),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.amber)),
      height: 60,
      alignment: Alignment.center,
      child: Text(text),
    );
  }
}
