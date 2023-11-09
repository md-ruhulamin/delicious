// ignore_for_file: prefer_const_constructors

import 'package:eshop/screen/checkout/welcomescreen.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/checkoutrpogresscircle.dart';
import 'package:eshop/widget/header.dart';
import 'package:eshop/widget/paymentamountText.dart';
import 'package:eshop/widget/round_button.dart';
import 'package:eshop/widget/textfieldforcehckout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            HeaderTextAndIcon(text: "Checkout", icon: Icons.arrow_back_ios),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 20, right: 10),
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
                      CheckOutProgressCircle(color: Colors.amber),
                      Container(
                        height: 3,
                        width: 90,
                        color: Colors.amber,
                      ),
                      CheckOutProgressCircle(color: Colors.amber)
                    ],
                  ),
                  const SizedBox(
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
                        color: Colors.grey,
                      ),
                      BigText(
                        text: "Order",
                        color: Colors.amber,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 6,
            ),
            BigText(
              text: "Billing Address",
              color: Colors.blue,
              size: 18,
            ),
            BigText(
              text: "Name :Aziiz Prithibi",
              size: 14,
            ),
            const SizedBox(
              height: 3,
            ),
            BigText(
              text: "Email :aziz@gmail.com ",
              size: 14,
            ),
            const SizedBox(
              height: 3,
            ),
            BigText(
              text: "Country :Bangladesh",
              size: 14,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            const SizedBox(
              height: 6,
            ),
            BigText(
              text: "Pickup Point Adress",
              color: Colors.blue,
              size: 18,
            ),
            Text("21 West Muradpur, Panchlaish,Chittagong",
                style: TextStyle(
                  fontSize: 12,
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            SizedBox(
              height: 3,
            ),
            BigText(
              text: "Payment Method",
              color: Colors.blue,
              size: 18,
            ),
            Text("Visa Card",
                style: TextStyle(
                  fontSize: 14,
                )),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 1,
              color: Colors.grey,
            ),
            BigText(
              text: "Product(s)",
              color: Colors.blue,
              size: 18,
            ),
            Container(
              height: 100,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 231, 230, 230),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Image(
                    image: AssetImage("assets/images/burger5.png"),
                    height: 120,
                    width: 120,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Chiness Side",
                        size: 12,
                      ),
                      BigText(
                        text: "Size           : Extra Large",
                        size: 12,
                      ),
                      BigText(
                        text: "Price          : \$12.77",
                        size: 12,
                      ),
                      BigText(
                        text: "Quantity     : 2",
                        size: 12,
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            BigText(
              text: "Order Calculation",
              color: Colors.blue,
              size: 18,
            ),
            Container(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 15, bottom: 10),
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              //    margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
              
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TwoText(text1: "Sub Total", text2: "873"),
                  TwoText(text1: "Delivery Charge", text2: "75"),
                  TwoText(text1: "Discount ", text2: "50"),
                  Container(
                    height: 1,
                    color: Colors.grey,
                  ),
                  TwoText(text1: "Total", text2: "923"),
                  SizedBox(
                    height: 10,
                  ),
                 
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  Get.to(WelcomeScreen());
                },
                child: RoundButton(text: "Next"))
          ]),
        ),
      ),
      // bottomNavigationBar: Container(
//         padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 10),
//         decoration: BoxDecoration(
//             color: Colors.amber, borderRadius: BorderRadius.circular(20)),
//     //    margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
//         height: 250,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TwoText(text1: "Sub Total", text2: "873"),
//             TwoText(text1: "Delivery Charge", text2: "75"),
//             TwoText(text1: "Discount ", text2: "50"),
//             Container(
//               height: 1,
//               color: Colors.grey,
//             ),
//             TwoText(text1: "Total", text2: "923"),
//             SizedBox(
//               height: 10,
//             ),
//             Container(
//               height: 60,
//               decoration: BoxDecoration(
//                   color: Colors.white, borderRadius: BorderRadius.circular(10)),
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
//               child: Center(
//                 child: Text("Place Order",
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold)),
//               ),
//             ),
//           ],
//         ),
//  )

      // ),
    );
  }
}
