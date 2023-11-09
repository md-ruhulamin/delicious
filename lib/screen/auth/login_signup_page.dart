// ignore_for_file: prefer_const_constructors

import 'package:eshop/screen/auth/signin.dart';
import 'package:eshop/screen/auth/signup.dart';
import 'package:eshop/utils/buble_indecator.dart';

import 'package:eshop/widget/theme.dart';
import 'package:flutter/material.dart';

class LoginSignUpScreen extends StatefulWidget {
  const LoginSignUpScreen({super.key});

  @override
  State<LoginSignUpScreen> createState() => _LoginSignUpScreen();
}

class _LoginSignUpScreen extends State<LoginSignUpScreen>
    with SingleTickerProviderStateMixin {
  Color left = Colors.black;
  Color right = Colors.white;
  late PageController _pageController;
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            top: 75,
          ),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: <Color>[
                  CustomTheme.loginGradientStart,
                  CustomTheme.loginGradientEnd
                ],
                begin: FractionalOffset(0.0, 0.0),
                end: FractionalOffset(1.0, 1.0),
                stops: <double>[0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          child: Column(mainAxisSize: MainAxisSize.max, children: [
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Image.asset(
                "assets/images/login_logo.png",
                height: 190,
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: _buildMenuBar(context),
            ),
            Expanded(
              flex: 2,
              child: PageView(
                physics: ClampingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (int i) {
                  FocusScope.of(context).requestFocus(FocusNode());
                  if (i == 0) {
                    setState(() {
                      right = Colors.white;
                      left = Colors.black;
                    });
                  } else if (i == 1) {
                    setState(() {
                      right = Colors.black;
                      left = Colors.white;
                    });
                  }
                },
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: SignIn(
                    
                    
                    ),
                  ),
                  ConstrainedBox(
                    constraints: BoxConstraints.expand(),
                    child: SignUp(),
                  )
                ],
              ),
            )
          ]),
        ),
      ),
    );
  }

  Widget _buildMenuBar(BuildContext context) {
    return Container(
      width: 300.0,
      height: 50.0,
      decoration: const BoxDecoration(
        color: Color(0x552B2B2B),
        borderRadius: BorderRadius.all(Radius.circular(25.0)),
      ),
      child: CustomPaint(
        painter: BubbleIndicatorPainter(pageController: _pageController),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignInButtonPress,
                child: Text(
                  'Existing',
                  style: TextStyle(
                      color: left, fontSize: 16.0, fontFamily: 'Lato'),
                ),
              ),
            ),
            //Container(height: 33.0, width: 1.0, color: Colors.white),
            Expanded(
              child: TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: _onSignUpButtonPress,
                child: Text(
                  'New',
                  style: TextStyle(
                      color: right, fontSize: 16.0, fontFamily: 'Lato'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onSignInButtonPress() {
    _pageController.animateToPage(0,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }

  void _onSignUpButtonPress() {
    _pageController.animateToPage(1,
        duration: const Duration(milliseconds: 500), curve: Curves.decelerate);
  }
}
