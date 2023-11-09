// ignore_for_file: prefer_const_constructors, must_be_immutable, use_build_context_synchronously

import 'package:eshop/home_with_navbar.dart';
import 'package:eshop/widget/snake_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VerifyCodeScreen extends StatefulWidget {
  String verificationcode;
  VerifyCodeScreen({super.key, required this.verificationcode});

  @override
  State<VerifyCodeScreen> createState() => _VerifyCodeScreenState();
}

class _VerifyCodeScreenState extends State<VerifyCodeScreen> {
  bool loading = false;
  final codeController = TextEditingController();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Verify Code Screen"),
      ),
      body: Column(children: [
        SizedBox(
          height: 70,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 90, vertical: 20),
          child: TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 6,
              controller: codeController,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)))),
        ),
        GestureDetector(
          onTap: () async {
            final authCredential = PhoneAuthProvider.credential(
                verificationId: widget.verificationcode,
                smsCode: codeController.text.toString().trim());

            try {
              await auth.signInWithCredential(authCredential);
              CustomSnackBar(context, Text("Number Verified"));
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => HomeWithNavBar())));
            } catch (e) {
              CustomSnackBar(context, Text("Failed to  Verify" + e.toString()));
            }
          },
          child: Container(
            height: 60,
            width: 220,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.amber,
            ),
            alignment: Alignment.center,
            child: Text(
              "Submit",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 23,
                  fontFamily: 'WorkSansSemiBold'),
            ),
          ),
        )
      ]),
    );
  }
}
