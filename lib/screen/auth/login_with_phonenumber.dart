// ignore_for_file: prefer_const_constructors

import 'package:eshop/screen/auth/veryfy_phone_number.dart';
import 'package:eshop/widget/snake_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWithPhoneNumber extends StatefulWidget {
  const LoginWithPhoneNumber({super.key});

  @override
  State<LoginWithPhoneNumber> createState() => _LoginWithPhoneNumberState();
}

class _LoginWithPhoneNumberState extends State<LoginWithPhoneNumber> {
  bool loading = false;
  final phonenumberController = TextEditingController();
  final auth = FirebaseAuth.instance;
  final FocusNode focusNodenumber = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        titleTextStyle: TextStyle(
            color: Colors.white, fontSize: 23, fontFamily: 'WorkSansSemiBold'),
        title: Text("Login with Phone"),
      ),
      body: Column(children: [
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: const EdgeInsets.only(
              top: 10.0, bottom: 10.0, left: 25.0, right: 25.0),
          child: TextField(
            focusNode: focusNodenumber,
            controller: phonenumberController,
            keyboardType: TextInputType.number,
            textCapitalization: TextCapitalization.words,
            autocorrect: false,
            style: const TextStyle(
                fontFamily: 'WorkSansSemiBold',
                fontSize: 16.0,
                color: Colors.black),
            decoration: const InputDecoration(
              icon: Icon(
                FontAwesomeIcons.phone,
                color: Colors.black,
              ),
              hintText: 'Phone Number',
              hintStyle:
                  TextStyle(fontFamily: 'WorkSansSemiBold', fontSize: 16.0),
            ),
            onSubmitted: (_) {
              focusNodenumber.requestFocus();
            },
          ),
        ),
        SizedBox(
          height: 50,
        ),
        MaterialButton(
          height: 50,
          minWidth: 200,
          color: Colors.purple,
          onPressed: () {
            String number =
                "+88${phonenumberController.text.toString().trim()}";
            auth.verifyPhoneNumber(
                phoneNumber: number,
                verificationCompleted: (_) {},
                verificationFailed: (e) {
                  CustomSnackBar(context, Text(e.toString()));
                },
                codeSent: (String verificationId, int? token) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => VerifyCodeScreen(
                                verificationcode: verificationId,
                              )));
                },
                codeAutoRetrievalTimeout: (e) {
                  CustomSnackBar(context, Text(e.toString()));
                });

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => VerifyCodeScreen(
                        verificationcode: "verificationcode"))));
          },
          child: Text(
            "Verify",
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'WorkSansSemiBold',
                fontSize: 22.0),
          ),
        )
      ]),
    );
  }
}
