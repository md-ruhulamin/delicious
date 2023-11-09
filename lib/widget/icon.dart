import 'package:flutter/material.dart';

class IconsStyle extends StatelessWidget {
 final IconData icon;

   IconsStyle({super.key,required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
height: 45,
width: 45,
      decoration: BoxDecoration(

        color: Colors.white,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Icon(icon,size: 26,color: Colors.red,),
    );
  }
}
