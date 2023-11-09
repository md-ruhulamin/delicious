// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HeaderTextAndIcon extends StatelessWidget {
  final String text;
  IconData icon;
  HeaderTextAndIcon({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 10, top: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
              ),
              width: 50,
              height: 50,
              child: Icon(icon)),
        ),
        Text(text,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const SizedBox(
          width: 30,
        ),
      ],
    );
  }
}
