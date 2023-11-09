// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:eshop/controller/cart_controller.dart';
import 'package:eshop/controller/food_controller.dart';
import 'package:eshop/utils/color.dart';
import 'package:eshop/repository/repository.dart';
import 'package:eshop/screen/checkout/shipping.dart';
import 'package:eshop/screen/product/homepage.dart';
import 'package:eshop/widget/header.dart';
import 'package:eshop/widget/icon.dart';
import 'package:eshop/widget/paymentamountText.dart';
import 'package:eshop/widget/round_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({super.key});

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  Repository productRepository = Get.put(Repository());
  CartController cartController = Get.put(CartController());
  HomePage homePage = HomePage();
  final ProductController productController = Get.find<ProductController>();

  bool isProductInCart(String productId) {
    // Check if the product ID is present in the cart
    return cartController.cartItems.containsKey(productId);
  }

  // @override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //   //  controller = PageController(viewportFraction: 0.6, initialPage: 0);
  //     productController
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 15, right: 15),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                HeaderTextAndIcon(
                  text: "Favorite Item List",
                  icon: Icons.arrow_back_ios,
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      color: Colors.amber, shape: BoxShape.circle),
                  child: Center(child: Obx(() {
                    return Text(
                      cartController.getTotalQuantity().toString(),
                      style: TextStyle(fontSize: 13, color: Colors.black),
                    );
                  })),
                )
              ]),
              Expanded(
                  child: ListView.builder(
                      itemCount: cartController.favorite.length,
                      itemBuilder: (context, index) {
                        final productId =
                            cartController.favorite.keys.toList()[index];
                        final product =
                            productRepository.getProductById(productId);

                        return Container(
                          margin: EdgeInsets.only(left: 0, top: 20),
                          height: 125,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        //      color: Colors.primaries[index % 5],
                                      ),
                                      margin: EdgeInsets.only(
                                          left: 15, top: 10, bottom: 4),
                                      child: Image.network(product.image)),
                                  Container(
                                    width: 280,
                                    margin: EdgeInsets.only(
                                        left: 5, top: 3, bottom: 3),
                                    child: Column(
                                      //  mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(product.name,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                style: TextStyle(
                                                    fontSize: 14,
                                                    color: Colors.black)),
                                            Obx(() {
                                              return Container(
                                                padding: EdgeInsets.only(right:10),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    print(cartController
                                                        .favouriteItems.length);
                                                    cartController
                                                        .addToFavorite(
                                                            product.id);
                                                            
                                                  },
                                                  child: cartController
                                                          .favouriteItems
                                                          .containsKey(
                                                              product.id)
                                                      ? Icon(
                                                          Icons
                                                              .favorite,size:30,color
                                                              :Colors.red
                                                        )
                                                      : Icon(
                                                          Icons
                                                              .favorite_border,size:30 ,color: Colors.red,
                                                        ),
                                                ),
                                              );
                                            })
                                          ],
                                        ),
                                        Text("\$ ${product.price}",
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 18,
                                            )),
                                        Row(
                                          children: [
                                            Text("${index}15 min  1.7km",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14,
                                                )),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Container(
                                              alignment: AlignmentDirectional
                                                  .bottomEnd,
                                              margin:
                                                  EdgeInsets.only(right: 5),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.end,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController
                                                          .removeFromCart(
                                                              productId);
                                                    },
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.amber,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(7),
                                                          // color: const Color.fromARGB(255, 225, 179, 175),
                                                        ),
                                                        width: 30,
                                                        height: 30,
                                                        child: Center(
                                                            child: Icon(
                                                                Icons.remove))),
                                                  ),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  Center(child: Obx(() {
                                                    return Text(
                                                      cartController
                                                          .getQuantity(
                                                              productId)
                                                          .toString(),
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          fontSize: 13,
                                                          color: Colors.black),
                                                    );
                                                  })),
                                                  SizedBox(
                                                    width: 15,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      cartController
                                                          .addToCart(productId);
                                                    },
                                                    child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.amber,
                                                          border: Border.all(
                                                              color:
                                                                  Colors.grey),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                          //  color: Colors.red,
                                                        ),
                                                        width: 30,
                                                        height: 30,
                                                        child: Center(
                                                            child: Icon(
                                                                Icons.add))),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      }))
            ],
          ),
        ),
      ),
      bottomNavigationBar: GestureDetector(
        onTap: () {
          Get.to(CHeckOutScreen());
        },
        child: Container(
            color: Colors.transparent,
            padding: EdgeInsets.only(left: 20, right: 20, top: 15, bottom: 30),
            width: 200,
            child: RoundButton(text: "Clear All")),
      ),

      //         bottomNavigationBar: Container(
      // decoration: BoxDecoration(
      //   color: Colors.transparent, // Set the background color to transparent
      // ),
      // child: BottomNavigationBar(
      //   type: BottomNavigationBarType.fixed, // Use this to prevent automatic shifting
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.shopping_cart),
      //       label: 'Cart',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      // ))
    );
  }
}
