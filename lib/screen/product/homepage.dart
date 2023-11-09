// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/controller/cart_controller.dart';
import 'package:eshop/controller/food_controller.dart';
import 'package:eshop/utils/color.dart';
import 'package:eshop/screen/product/details_page.dart';
import 'package:eshop/screen/user/user_profile.dart';
import 'package:eshop/screen/firebase/operation/add.dart';
import 'package:eshop/model/category_model.dart';

import 'package:eshop/model/products_model.dart';
import 'package:eshop/screen/product/categorylist.dart';
import 'package:eshop/widget/appicon.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  CartController cartController = Get.find<CartController>();
  TextEditingController searchController = TextEditingController();
  final ProductController productController = Get.find<ProductController>();

  PageController controller = PageController();

  bool isProductInCart(String productId) {
    // Check if the product ID is present in the cart
    return cartController.cartItems.containsKey(productId);
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      productController.getproducts();
      controller = PageController(
        viewportFraction: 0.7,
        initialPage: 0,
      );
    });
  }

  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: white,
        automaticallyImplyLeading: false,
        leadingWidth: 40,
        leading: TextButton(
          onPressed: () {},
          child: Image.asset(
            'assets/icons/menu.png',
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Get.to(UserProfile());
            },
            child: Container(
              height: 50,
              width: 40,
              margin: const EdgeInsets.only(right: 20, top: 10, bottom: 5),
              decoration: BoxDecoration(
                color: green,
                boxShadow: [
                  BoxShadow(
                    color: green.withOpacity(0.5),
                    blurRadius: 10,
                    offset: const Offset(0, 0),
                  ),
                ],
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: AssetImage('assets/images/pro.png'),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: Drawer(child: UserProfile()),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Color.fromARGB(255, 241, 238, 238),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 150, 88, 88),
                    ),
                    SizedBox(width: 8),
                    Expanded(
                      child: TextField(
                        controller: searchController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search...",
                        ),
                        onChanged: (value) {
                          setState(() {});
                        },
                      ),
                    ),
                  ],
                ),
              ),

              //  Row(
              //   children: [
              //     Container(
              //       height: 45.0,
              //       width: 380.0,
              //       padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //       decoration: BoxDecoration(
              //         color: white,
              //         border: Border.all(color: green),
              //         boxShadow: [
              //           BoxShadow(
              //             color: green.withOpacity(0.15),
              //             blurRadius: 10,
              //             offset: const Offset(0, 0),
              //           ),
              //         ],
              //         borderRadius: BorderRadius.circular(10.0),
              //       ),
              //       child: Row(
              //         children: [
              //           const SizedBox(
              //             height: 45,
              //             width: 330,
              //             child: TextField(
              //           controller:searchController,
              //           decoration: InputDecoration(
              //             border: InputBorder.none,
              //             hintText: "Search...",
              //           ),
              //           onChanged: (value) {
              //             setState(() {});
              //           },
              //         ),
              //           ),
              //           Image.asset(
              //             'assets/icons/search.png',
              //             height: 25,
              //           )
              //         ],
              //       ),
              //     ),
              //     const SizedBox(width: 10),
              //     // Container(
              //     //   height: 45.0,
              //     //   width: 45.0,
              //     //   padding: const EdgeInsets.symmetric(horizontal: 10.0),
              //     //   decoration: BoxDecoration(
              //     //     color: green,
              //     //     boxShadow: [
              //     //       BoxShadow(
              //     //         color: green.withOpacity(0.5),
              //     //         blurRadius: 10,
              //     //         offset: const Offset(0, 0),
              //     //       ),
              //     //     ],
              //     //     borderRadius: BorderRadius.circular(10.0),
              //     //   ),
              //     //   child: GestureDetector(
              //     //     onTap: () {
              //     //       Get.to(ProductListPage());
              //     //     },
              //     //     child: Image.asset(
              //     //       'assets/icons/adjust.png',
              //     //       color: white,
              //     //       height: 25,
              //     //     ),
              //     //   ),
              //    // ),
              //   ],
              // ),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       for (int i = 0; i < categories.length; i++)
            //         GestureDetector(
            //           onTap: () {
            //             setState(() {
            //               selectId = categories[i].id;
            //               print(i);
            //             });
            //           },
            //           child: Column(
            //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //             children: [
            //               // Container(

            //               //   decoration: BoxDecoration(    color: green,
            //               //     borderRadius: BorderRadius.circular(10),
            //               //   ),
            //               //   child:

            //               Container(
            //                 padding: EdgeInsets.symmetric(
            //                     horizontal: 10, vertical: 2),
            //                 child: Text(
            //                   categories[i].name,
            //                   style: TextStyle(
            //                     color: selectId == i
            //                         ? green
            //                         : black.withOpacity(0.7),
            //                     fontSize: 16.0,
            //                   ),
            //                 ),
            //               ),
            //               //   ),
            //               if (selectId == i)
            //                 const CircleAvatar(
            //                   radius: 3,
            //                   backgroundColor: green,
            //                 )
            //             ],
            //           ),
            //         )
            //     ],
            //   ),
            // ),

            SizedBox(
              height: 290,
              width: double.infinity,
              child: Obx(() {
                if (productController.isLoading.value) {
                  print("loading");
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.cyanAccent,
                  ));
                } else if (productController.hasError.value) {
                  print("error");
                  return Center(child: Text(productController.error.value));
                } else {
                  // List<Product> products = fetchMyData();
                  // List<Product> productList = [];

                  // for (int i = 0; i < products.length; i++) {
                  //   if (searchController.text.isEmpty) {
                  //     productList.add(products[i]);
                  //     print(products[i].name);
                  //   } else if (products[i]
                  //       .name
                  //       .toLowerCase()
                  //       .contains(searchController.text.toLowerCase())) {
                  //     productList.add(products[i]);
                  //     print(products[i].name);
                  //     print(productList[0]);
                  //   } else {
                  //     continue;
                  //   }
                  // }

                  return PageView.builder(
                      itemCount: productController.products1.length,
                      controller: controller,
                      physics: const BouncingScrollPhysics(),
                      padEnds: false,
                      pageSnapping: true,
                      onPageChanged: (value) =>
                          setState(() => activePage = value),
                      itemBuilder: (itemBuilder, index) {
                        bool active = index == activePage;
                        return slider(active, index,
                            productController.products1[index]);
                      });
                }
              }),
            ),
            // GetBuilder<ProductController>(builder: (productController) {
            //   productController.getproducts;
            //   final productList = productController.products;

            //   print(productList.length);

            //   return productController.isLoaded
            //       ? SizedBox(
            //           height: 340.0,
            //           child: PageView.builder(
            //             itemCount: productList.length,
            //             controller: controller,
            //             physics: const BouncingScrollPhysics(),
            //             padEnds: false,
            //             pageSnapping: true,
            //             onPageChanged: (value) =>
            //                 setState(() => activePage = value),
            //             itemBuilder: (itemBuilder, index) {
            //               bool active = index == activePage;
            //               return slider(active, index, productList[index]);
            //             },
            //           ),
            //         )
            //       : Container(
            //           height: 200,
            //           color: Colors.red,
            //         );
            // }),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular',
                    style: TextStyle(
                      color: black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/more.png',
                    color: green,
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: Obx(() {
                if (productController.isLoading.value) {
                  print("loading");
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.cyanAccent,
                  ));
                } else if (productController.hasError.value) {
                  print("error");
                  return Center(child: Text(productController.error.value));
                } else {
                  print("loaded");

                  return ListView.builder(
                    itemCount: productController.products1.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20.0),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) {
                      final product = productController.products1[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailScreen(index: index, product: product));
                        },
                        child: Container(
                          width: 160,
                          margin: const EdgeInsets.only(right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: green.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: Image.network(
                                      product.image,
                                      height: 85,
                                      width: 85,
                                    ),
                                  ),
                                  const SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: black.withOpacity(0.7),
                                          fontWeight: FontWeight.w200,
                                        ),
                                      ),
                                      Text(
                                        " \$ ${product.price.toString()}",
                                        style: TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              // Positioned(
                              //   right: 15,
                              //   top: 15,
                              //   child: CircleAvatar(
                              //     backgroundColor: green,
                              //     radius: 15,
                              //     child: Image.asset(
                              //       'assets/icons/add.png',
                              //       color: white,
                              //       height: 15,
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recommended Food ',
                    style: TextStyle(
                      color: black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                    ),
                  ),
                  Image.asset(
                    'assets/icons/more.png',
                    color: green,
                    height: 20,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 160,
              child: Obx(() {
                if (productController.isLoading.value) {
                  print("loading");
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.cyanAccent,
                  ));
                } else if (productController.hasError.value) {
                  print("error");
                  return Center(child: Text(productController.error.value));
                } else {
                  print("loaded");

                  return ListView.builder(
                    itemCount: productController.products1.length,
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(left: 20.0, right: 10),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (itemBuilder, index) {
                      final product = productController.products1[
                          productController.products1.length - 1 - index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(DetailScreen(index: index, product: product));
                        },
                        child: Container(
                          width: 160,
                          margin: const EdgeInsets.only(right: 10, bottom: 10),
                          decoration: BoxDecoration(
                            color: white,
                            boxShadow: [
                              BoxShadow(
                                color: green.withOpacity(0.1),
                                blurRadius: 10,
                                offset: const Offset(0, 5),
                              ),
                            ],
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Center(
                                    child: Image.network(
                                      product.image,
                                      height: 85,
                                      width: 85,
                                    ),
                                  ),
                                  const SizedBox(width: 7.0),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        product.name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: black.withOpacity(0.9),
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        " \$ ${product.price.toString()}",
                                        style: TextStyle(
                                          color: black,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              Positioned(
                                right: 15,
                                top: 15,
                                child: CircleAvatar(
                                  backgroundColor: green,
                                  radius: 15,
                                  child: Image.asset(
                                    'assets/icons/add.png',
                                    color: white,
                                    height: 15,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              }),
            ),

            // Container(
            //   height: 320,
            //   child: Expanded(
            //     child: FutureBuilder<List<Product>>(
            //               future: fetchMyData(),
            //               builder: (context, snapshot) {
            //                 if (snapshot.connectionState == ConnectionState.waiting) {
            //                   return Center(child: CircularProgressIndicator());
            //                 } else if (snapshot.hasError) {
            //                   return Text('Error: ${snapshot.error}');
            //                 } else {
            //                   final productList = snapshot.data;

            //                   return ListView.builder(
            //                       itemCount: productList!.length,
            //                       itemBuilder: ((context, index) {
            //                         if (searchContrroler.text.isEmpty) {
            //                           return GestureDetector(
            //                             onTap: () {
            //                               Get.to(DetailScreen(
            //                                 index: index,
            //                                 product: productList[index],
            //                               ));
            //                             },
            //                             child: Container(
            //                               margin: EdgeInsets.only(bottom: 10),
            //                               height: 200,
            //                               padding: EdgeInsets.all(10),
            //                               decoration: BoxDecoration(
            //                                   color:
            //                                       Color.fromARGB(255, 241, 213, 151),
            //                                   borderRadius:
            //                                       BorderRadius.circular(10)),
            //                               child: Row(
            //                                 crossAxisAlignment:
            //                                     CrossAxisAlignment.start,
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.spaceBetween,
            //                                 children: [
            //                                   Center(
            //                                     child: Image.network(
            //                                       productList[index].image,
            //                                       //  fit: BoxFit.cover,
            //                                       height: 100,
            //                                       width: 100,
            //                                     ),
            //                                   ),
            //                                   SizedBox(
            //                                     width: 8,
            //                                   ),
            //                                   Container(
            //                                     width: 220,
            //                                     child: Column(
            //                                       crossAxisAlignment:
            //                                           CrossAxisAlignment.start,
            //                                       children: [
            //                                         BigText(
            //                                           text: productList[index].name,
            //                                         ),
            //                                         Container(
            //                                           child: Text(
            //                                             productList[index]
            //                                                 .description,
            //                                             overflow:
            //                                                 TextOverflow.ellipsis,
            //                                             style: TextStyle(
            //                                                 fontSize: 12,
            //                                                 color:
            //                                                     const Color.fromARGB(
            //                                                         255,
            //                                                         103,
            //                                                         101,
            //                                                         101)),
            //                                             maxLines: 2,
            //                                           ),
            //                                         ),
            //                                         Text("Chittagong ,Muradpur",
            //                                             style:
            //                                                 TextStyle(fontSize: 12)),
            //                                         AppIcon(
            //                                             text: productList[index]
            //                                                 .rating
            //                                                 .toString(),
            //                                             icon: Icons
            //                                                 .star_purple500_outlined),
            //                                         BigText(
            //                                             text:
            //                                                 "\$${productList[index].price.toString()}"),
            //                                       ],
            //                                     ),
            //                                   ),
            //                                   Column(
            //                                       mainAxisAlignment:
            //                                           MainAxisAlignment.spaceBetween,
            //                                       children: [
            //                                         IconsStyle(
            //                                           icon: Icons.favorite_border,
            //                                         ),
            //                                         IconsStyle(
            //                                           icon: Icons.shopping_cart,
            //                                         )
            //                                       ]),
            //                                 ],
            //                               ),
            //                             ),
            //                           );
            //                         } else if (productList[index]
            //                             .name
            //                             .toLowerCase()
            //                             .contains(
            //                                 searchContrroler.text.toLowerCase())) {
            //                           return GestureDetector(
            //                             onTap: () {
            //                               Get.to(DetailScreen(
            //                                 index: index,
            //                                 product: productList[index],
            //                               ));
            //                             },
            //                             child: Container(
            //                               margin: EdgeInsets.only(bottom: 10),
            //                               height: 200,
            //                               padding: EdgeInsets.all(10),
            //                               decoration: BoxDecoration(
            //                                   color:
            //                                       Color.fromARGB(255, 241, 213, 151),
            //                                   borderRadius:
            //                                       BorderRadius.circular(10)),
            //                               child: Row(
            //                                 crossAxisAlignment:
            //                                     CrossAxisAlignment.start,
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.spaceBetween,
            //                                 children: [
            //                                   Center(
            //                                     child: Image.network(
            //                                       productList[index].image,
            //                                       //  fit: BoxFit.cover,
            //                                       height: 100,
            //                                       width: 100,
            //                                     ),
            //                                   ),
            //                                   SizedBox(
            //                                     width: 8,
            //                                   ),
            //                                   Container(
            //                                     width: 220,
            //                                     child: Column(
            //                                       crossAxisAlignment:
            //                                           CrossAxisAlignment.start,
            //                                       children: [
            //                                         BigText(
            //                                           text: productList[index].name,
            //                                         ),
            //                                         Container(
            //                                           child: Text(
            //                                             productList[index]
            //                                                 .description,
            //                                             overflow:
            //                                                 TextOverflow.ellipsis,
            //                                             style: TextStyle(
            //                                                 fontSize: 12,
            //                                                 color:
            //                                                     const Color.fromARGB(
            //                                                         255,
            //                                                         103,
            //                                                         101,
            //                                                         101)),
            //                                             maxLines: 2,
            //                                           ),
            //                                         ),
            //                                         Text("Chittagong ,Muradpur",
            //                                             style:
            //                                                 TextStyle(fontSize: 12)),
            //                                         AppIcon(
            //                                             text: productList[index]
            //                                                 .rating
            //                                                 .toString(),
            //                                             icon: Icons
            //                                                 .star_purple500_outlined),
            //                                         BigText(
            //                                             text:
            //                                                 "\$${productList[index].price.toString()}"),
            //                                       ],
            //                                     ),
            //                                   ),
            //                                   Column(
            //                                       mainAxisAlignment:
            //                                           MainAxisAlignment.spaceBetween,
            //                                       children: [
            //                                         IconsStyle(
            //                                           icon: Icons.favorite_border,
            //                                         ),
            //                                         IconsStyle(
            //                                           icon: Icons.shopping_cart,
            //                                         )
            //                                       ]),
            //                                 ],
            //                               ),
            //                             ),
            //                           );
            //                         } else {
            //                           return Container();
            //                         }
            //                       }));
            //                 }
            //               }),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  AnimatedContainer slider(active, index, Product productlist) {
    double margin = active ? 20 : 25;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      child: mainPlantsCard(index, productlist),
    );
  }

  Widget mainPlantsCard(index, Product product) {
    return GestureDetector(
      onTap: () {
        print(product.name);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (builder) => DetailScreen(
              index: index,
              product: product,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: black.withOpacity(0.5),
              blurRadius: 15,
              offset: const Offset(5, 5),
            ),
          ],
          border: Border.all(color: green, width: 2),
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Stack(
          children: [
            Container(
              margin: EdgeInsets.only(left: 40, top: 10),
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                color: white,
                boxShadow: [
                  BoxShadow(
                    color: black.withOpacity(0.05),
                    blurRadius: 5,
                    //  offset: const Offset(5, 5),
                  ),
                ],
                borderRadius: BorderRadius.circular(25.0),
                image: DecorationImage(
                  image: NetworkImage(
                    product.image,
                  ),
                ),
              ),
            ),
            Positioned(
                right: 8,
                top: 10,
                child: Obx(() {
                  return CircleAvatar(
                    backgroundColor: green,
                    radius: 15,
                    child: isProductInCart(product.id)
                        ? Icon(
                            Icons.check,
                            color: white,
                          )
                        : Image.asset(
                            'assets/icons/add.png',
                            color: white,
                            height: 15,
                          ),
                  );
                })),
            Positioned(
              left: 8,
              top: 10,
              child: Obx(() {
                return Container(
                  padding: EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      print(cartController.favouriteItems.length);
                      cartController.addToFavorite(product.id);
                    },
                    child: cartController.favouriteItems.containsKey(product.id)
                        ? Icon(Icons.favorite, size: 30, color: Colors.red)
                        : Icon(
                            Icons.favorite_border,
                            size: 30,
                            color: Colors.red,
                          ),
                  ),
                );
              }),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.name,
                        style: TextStyle(
                          color: black.withOpacity(0.5),
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16.0,
                        )),
                    Text("\$" + product.price.toString(),
                        style: TextStyle(
                          color: black.withOpacity(0.7),
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        )),
                  ]),
            )
          ],
        ),
      ),
    );
  }

  Future<List<Product>> fetchMyData() async {
    final QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('products').get();
    return querySnapshot.docs.map((doc) {
      final id = doc.id;
      final data = doc.data() as Map<String, dynamic>;
      return Product.fromMap(data, id);
    }).toList();
  }

  int selectId = 0;
  int activePage = 0;
}
