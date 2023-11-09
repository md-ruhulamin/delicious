// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eshop/controller/cart_controller.dart';
import 'package:eshop/controller/food_controller.dart';
import 'package:eshop/screen/product/cart_screen.dart';
import 'package:eshop/screen/product/homepage.dart';
import 'package:eshop/model/products_model.dart';
import 'package:eshop/utils/dimensions.dart';
import 'package:eshop/widget/appicon.dart';
import 'package:eshop/widget/scroll_able_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailScreen extends StatelessWidget {
  final Product product;
  final int index;
  DetailScreen({super.key, required this.index, required this.product});
  CartController cartController = Get.put(CartController());
  final ProductController productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 125, 122, 114),
      
        body: GetBuilder<ProductController>(
          builder: (controller) {
            controller.fetchProducts();
            final productList = controller.products1;
            return productList.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Stack(clipBehavior: Clip.none, children: [
                    Positioned(
                      left: 0,
                      top: 0,
                      child: Container(
                        height: 450,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                //  fit: BoxFit.cover,
                                image: NetworkImage(product.image)),
                            color: Colors.white),
                      ),
                    ),

                    Positioned(
                        left: 40,
                        top: 60,
                        child: Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.amber),
                            width: 50,
                            height: 50,
                            child: GestureDetector(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back_ios)))),

                    Positioned(
                      right: 40,
                      top: 60,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(CartPage());
                        },
                        child: Container(
                            alignment: Alignment.center,
                            // padding: EdgeInsets.only(left: 10),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.amber),
                            width: 50,
                            height: 50,
                            child: Icon(
                              Icons.shopping_cart_checkout_outlined,
                              color: Colors.black,
                              size: 26,
                            )),
                      ),
                    ),
                    Positioned(
                        right: 46,
                        top: 63,
                        child: Container(
                          height: 23,
                          width: 23,
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                          child: Center(child: Obx(() {
                            return Text(
                              cartController.getTotalQuantity().toString(),
                              style:
                                  TextStyle(fontSize: 13, color: Colors.black),
                            );
                          })),
                        )),
                    Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: 520,
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 203, 241, 205),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30))),
                          child: Column(
                            children: [
                              Positioned(
                                  left: 0,
                                  child: Container(
                                    padding: EdgeInsets.only(
                                        top: 15,
                                        left: 10,
                                        right: Dimensions.width10),
                                    width: MediaQuery.of(context).size.width,
                                    child: Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            product.name,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              AppIcon(
                                                  text: '50 Min',
                                                  icon: Icons.timer),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              AppIcon(
                                                  text: productList[index]
                                                      .rating
                                                      .toString(),
                                                  icon: Icons.star),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              AppIcon(
                                                  text: '325Kcal',
                                                  icon: Icons.light_mode_sharp)
                                            ],
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          SingleChildScrollView(
                                            child: Container(
                                              height: 300,
                                              child: ScrollText(
                                                  text: product.description),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )),
                              Positioned(
                                left: (Get.width - 320) * 0.5,
                                bottom: 20,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                  height: 60,
                                  width: 320,
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(left: 18),
                                          child: Text(
                                            " \$" + product.price.toString(),
                                            style: TextStyle(
                                                fontSize: 20,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ),
                                        Container(
                                          height: 60,
                                          width: 200,
                                          decoration: BoxDecoration(
                                            color: Colors.amber,
                                            borderRadius:
                                                BorderRadius.circular(30),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    cartController
                                                        .removeFromCart(
                                                            product.id);
                                                    // Get.snackbar("Cart",
                                                    //     "Pressed Remove ${cartController.getQuantity(productList[index].id)}",
                                                    //     backgroundColor:
                                                    //         Colors.amber,
                                                    //     snackPosition:
                                                    //         SnackPosition.TOP);
                                                  },
                                                  child: Icon(Icons.remove,
                                                      color: Colors.black)),
                                              Container(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 5),
                                                height: 50,
                                                width: 50,
                                                decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    color: const Color.fromARGB(
                                                        255, 255, 255, 255)),
                                                child: Center(child: Obx(() {
                                                  return Text(
                                                    cartController
                                                        .getQuantity(product.id)
                                                        .toString(),
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18,
                                                        color: Colors.black),
                                                  );
                                                })),
                                              ),
                                              GestureDetector(
                                                  onTap: () {
                                                    cartController
                                                        .addToCart(product.id);

                                                    // print(cartController.cart);
                                                    // Get.snackbar("Cart",
                                                    //     "Pressed Add ${cartController.getQuantity(productList[index].id)}",
                                                    //     backgroundColor:
                                                    //         Colors.amber,
                                                    //     snackPosition:
                                                    //         SnackPosition.TOP);
                                                  },
                                                  child: Icon(Icons.add,
                                                      color: Colors.black))
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              )
                            ],
                          ),
                        )),
                    // Positioned(
                    //   top: 150,
                    //   //MediaQuery.of(context).size.width/2
                    //   left: 110,
                    //   child: Container(
                    //     height: 200,
                    //     width: 200,
                    //     decoration: BoxDecoration(
                    //         image: DecorationImage(
                    //             fit: BoxFit.cover,
                    //             image: AssetImage("assets/images/food6.png")),
                    //         shape: BoxShape.circle,
                    //         color: Colors.white),
                    //   ),
                    // ),
                  ]);
          },
        ));
  }
}
