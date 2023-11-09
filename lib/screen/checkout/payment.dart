// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:eshop/screen/checkout/order.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/carddetails.dart';
import 'package:eshop/widget/checkoutrpogresscircle.dart';
import 'package:eshop/widget/header.dart';
import 'package:eshop/widget/paymentcontainer.dart';
import 'package:eshop/widget/round_button.dart';
import 'package:eshop/widget/textfieldforcehckout.dart';
import 'package:flutter/material.dart';

import 'package:get/route_manager.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

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
                        color: Colors.amber,
                      ),
                      CheckOutProgressCircle(
                        color: Colors.amber,
                      ),
                      Container(
                        height: 3,
                        width: 90,
                        color: Colors.grey,
                      ),
                      CheckOutProgressCircle(
                        color: Colors.grey,
                      )
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
                        color: Colors.grey,
                      ),
                      BigText(
                        text: "Payment",
                        color: Colors.black,
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
              color: const Color.fromARGB(255, 190, 188, 188),
            ),
            SizedBox(
              height: 10,
            ),
            BigText(
              text: "Payment Method",
              size: 18,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(child: PaymentContainer(text: "Credit Card")),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: PaymentContainer(text: "Paypal")),
                SizedBox(
                  width: 5,
                ),
                Expanded(child: PaymentContainer(text: "bKash")),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 1,
              color: const Color.fromARGB(255, 190, 188, 188),
            ),
            SizedBox(
              height: 15,
            ),
            CardInfo(
                property: "Card Number", propertyvalue: "1287-8127-78456-3843"),
            SizedBox(
              height: 15,
            ),
            CardInfo(property: "Password", propertyvalue: "12878127"),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  child:
                      CardInfo(property: "CCV", propertyvalue: "***"),
                ), SizedBox(width: 20,), Expanded(
                  child:
                      CardInfo(property: "Entry Date", propertyvalue: "04-12"),
                ),
                
              ],
            ),  SizedBox(
              height: 10,
            ),   CardInfo(
                property: "Email Adress ", propertyvalue: "Optimal"),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(OrderScreen());
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
