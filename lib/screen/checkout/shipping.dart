// ignore_for_file: prefer_const_constructors

import 'package:eshop/screen/checkout/payment.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/checkoutrpogresscircle.dart';
import 'package:eshop/widget/header.dart';
import 'package:eshop/widget/round_button.dart';
import 'package:eshop/widget/textfieldforcehckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CHeckOutScreen extends StatelessWidget {
  const CHeckOutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(top: 50, left: 25, right: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeaderTextAndIcon(text: "Checkout", icon: Icons.arrow_back_ios),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.only(top: 10, left: 20, right: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CheckOutProgressCircle(
                        color: Colors.amber,
                      ),
                      Container(
                        height: 3,
                        width: 90,
                        color: Colors.grey,
                      ),
                      CheckOutProgressCircle(color: Colors.grey),
                      Container(
                        height: 3,
                        width: 90,
                        color: Colors.grey,
                      ),
                      CheckOutProgressCircle(color: Colors.grey)
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      BigText(
                        text: "Shipping",
                        color: Colors.black,
                      ),
                      BigText(
                        text: "Payment",
                        color: Colors.grey,
                      ),
                      BigText(
                        text: "Order",
                        color: Colors.grey,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 10,
            ),
            BigText(
              text: "Contact Details",
              size: 18,
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldForCheckout(text: "Full Name"),
            SizedBox(
              height: 15,
            ),
            TextFieldForCheckout(
              text: "Email",
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldForCheckout(
              text: "Phone Number",
            ),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 15,
            ),
            BigText(
              text: " Service Area ",
              size: 20,
            ),
            SizedBox(
              height: 15,
            ),
            TextFieldForCheckout(text: "Country"),
            SizedBox(
              height: 15,
            ),
            TextFieldForCheckout(
              text: "City",
            ),
            SizedBox(
              height: 10,
            ),
            TextFieldForCheckout(
              text: "Street Adrees",
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(PaymentScreen());
                },
                child: RoundButton(text: "Next"))
          ]),
        ),
      ),
      // bottomNavigationBar:

      // Container(
      //   padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
      //   decoration: BoxDecoration(
      //       color: Colors.amber, borderRadius: BorderRadius.circular(20)),
      //   margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
      //   height: 250,
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.spaceAround,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       TwoText(text1: "Sub Total", text2: "873"),
      //       TwoText(text1: "Delivery Charge", text2: "75"),
      //       TwoText(text1: "Discount ", text2: "50"),
      //       Container(
      //         height: 1,
      //         color: Colors.grey,
      //       ),
      //       TwoText(text1: "Total", text2: "923"),
      //       SizedBox(
      //         height: 10,
      //       ),
      //       Container(
      //         height: 60,
      //         decoration: BoxDecoration(
      //             color: Colors.white, borderRadius: BorderRadius.circular(10)),
      //         padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      //         child: Center(
      //           child: Text("Place Order",
      //               style: TextStyle(
      //                   fontSize: 16,
      //                   color: Colors.black,
      //                   fontWeight: FontWeight.bold)),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
