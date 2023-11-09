// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/screen/product/homepage.dart';
import 'package:eshop/utils/dimensions.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/profileinfo.dart';
import 'package:eshop/widget/scroll_able_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: CircleAvatar(
                    maxRadius: 80,
                    minRadius: 30,backgroundColor: Colors.amber,
                    child: Image.asset("assets/images/pro.png",)),
              ),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(30)),
                  child: BigText(
                    text: "Opurba Bhoimik",
                    size: 20,
                  )),
              Text("apurba@gmail.com"),
              SizedBox(height: 10),
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    "This is every persons bio,he or ashe can write some thing here about",
                    textAlign: TextAlign.center,
                  )),
              SizedBox(
                height: 10,
              ),
              ProfileInfo(icon: Icons.phone, text: "01856 987383"),
              ProfileInfo(icon: Icons.shopping_bag, text:"My Orders"),
               ProfileInfo(icon: Icons.location_on, text:"My Location"),
                ProfileInfo(icon: Icons.payment, text:"My Payment"),
              ProfileInfo(icon: Icons.privacy_tip, text: "Privacy"),
              ProfileInfo(icon: Icons.help, text: "Help & Support"),
              ProfileInfo(icon: Icons.settings, text: "Setting"),
              ProfileInfo(icon: Icons.group, text: "Invaite a Friend"),
              GestureDetector(
                  onTap: () {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    auth.signOut();
                    Get.snackbar("Activity", "Signed Out");
                    Get.to(HomePage());
                  },
                  child: ProfileInfo(icon: Icons.logout_outlined, text: "Logout"))
            ],
          ),
        ),
      ),
    );
  }
}
