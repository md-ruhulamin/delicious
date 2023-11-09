// ignore_for_file: prefer_const_constructors

import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/round_button.dart';
import 'package:eshop/widget/snake_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ForgetPAsswordScreen extends StatefulWidget {
  const ForgetPAsswordScreen({super.key});

  @override
  State<ForgetPAsswordScreen> createState() => _ForgetPAsswordScreenState();
}

class _ForgetPAsswordScreenState extends State<ForgetPAsswordScreen> {
  final auth = FirebaseAuth.instance;

  final databaseRef = FirebaseDatabase.instance.ref("Post");

  final emailCOntroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(children: [
        SizedBox(
          height: 80,
        ),
        BigText(
          text: "Enter Your Email Address",
        ),
        SizedBox(
          height: 30,
        ),
        SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
            child: TextFormField(
              controller: emailCOntroller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        GestureDetector(
          onTap: () {
            auth
                .sendPasswordResetEmail(
                    email: emailCOntroller.text.toString().trim())
                .then((value) {
              CustomSnackBar(context,
                  Text("We have send password reset link to your email"));
            }).onError((error, stackTrace) {
              CustomSnackBar(context, Text("Failed$error"));
            });

            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => FilterList()));
          },
          child: RoundButton(
            text: "Submit",
          ),
        )
      ]),
    ));
  }
}
