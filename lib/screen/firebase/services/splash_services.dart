// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:eshop/screen/auth/login_signup_page.dart';
import 'package:eshop/screen/product/homepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {

  
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePage())));
    } else {
      Timer(
          Duration(seconds: 3),
          () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => LoginSignUpScreen())));
    }
  }
}
