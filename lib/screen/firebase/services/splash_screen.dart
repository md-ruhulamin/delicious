// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:eshop/controller/cart_controller.dart';
import 'package:eshop/controller/food_controller.dart';
import 'package:eshop/home_with_navbar.dart';
import 'package:eshop/screen/firebase/services/splash_services.dart';
import 'package:eshop/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SplashServices splashServices = SplashServices();

  final prodcutController = ProductController();

  loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final cartData = prefs.getString('cart');
    final favorite = prefs.getString('favoriteItem');

    final cartController = Get.put(CartController());

    if (cartData != null) {
      final decodedData = jsonDecode(cartData);
      final cartMap = Map<String, int>.from(
          decodedData); // Convert the decoded data to a Map<String, int>
      cartController.cartItems.assignAll(cartMap); // Update t
      print(cartController.cartItems);
    }
    if (favorite != null) {
      final decodedData = jsonDecode(favorite);
      final favoriteMap = Map<String, int>.from(
          decodedData); // Convert the decoded data to a Map<String, int>
      cartController.favouriteItems.assignAll(favoriteMap); // Update t
      print(cartController.favouriteItems);
    }
  }

  @override
  void initState() {
    super.initState();
  splashServices.isLogin(context);
    prodcutController.fetchProducts();
    loadCart();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 20, right: 20, top: 70, bottom: 60),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      padding: EdgeInsets.only(top: 50),
                      child: Text("Welcome to Delicious..",
                          style: TextStyle(
                            fontSize: 22,
                            color: Colors.amber,
                          ))),

                  // SizedBox(R
                  //   height: 40,
                  // ),
                  // Image.asset("assets/images/burger.png"),
                  // SizedBox(
                  //   height: 40,
                  // ),
                  SizedBox(
                    height: 40,
                  ),
                  RotatingSquare(),
                  SizedBox(
                    height: 40,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Eat Organic .",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 112, 108, 108),
                        ),
                      ),
                      Text(" Every Day",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.red,
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                      "You could make this tasty meal for breakfast,Launch and Dinner  or Anytime",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey,
                      )),
                  //  RotatingSquare(),
                  // SizedBox(
                  //   height: 30,
                  // ),
                  Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.to(HomeWithNavBar());
                      },
                      child: RoundButton(text: "Get Started")),
                ],
              ),
            )));
  }
}

class RotatingSquare extends StatefulWidget {
  @override
  _RotatingSquareState createState() => _RotatingSquareState();
}

class _RotatingSquareState extends State<RotatingSquare>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 10), // Adjust the duration as needed
      vsync: this,
    )..repeat(); // Repeats the animation continuously
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: _controller,
        child: Container(
          width: 300,
          height: 300,
          child: Image.asset("assets/images/burger.png"),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller
        .dispose(); // Dispose of the animation controller when not needed
    super.dispose();
  }
}
