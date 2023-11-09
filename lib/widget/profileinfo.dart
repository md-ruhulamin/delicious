// ignore_for_file: prefer_const_constructors

import 'package:eshop/utils/dimensions.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final IconData icon;
  final String text;
  ProfileInfo({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7,bottom: 7),
      width: Dimensions.screenWidth * .90,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
         color: Color.fromARGB(255, 248, 247, 247),
          borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Icon(icon,color: Colors.amber,),
          SizedBox(
            width: 20,
          ),
          BigText(text: text,),
          Spacer(),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
