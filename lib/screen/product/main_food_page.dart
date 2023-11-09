// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/screen/product/details_page.dart';
import 'package:eshop/screen/product/favorite.dart';
import 'package:eshop/screen/firebase/operation/add.dart';
import 'package:eshop/model/products_model.dart';
import 'package:eshop/widget/appicon.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/header.dart';
import 'package:eshop/widget/icon.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FoodPage extends StatefulWidget {
  const FoodPage({super.key});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  TextEditingController searchContrroler = TextEditingController();
  final _auth = FirebaseAuth.instance;
  signOut() async {
    await _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 247, 245, 245),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeaderTextAndIcon(
                    text: "Popular Food Item",
                    icon: Icons.arrow_back_ios,
                  ),
                  GestureDetector(
                    onTap: () {
                      //   signOut();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FavoritePage()));
                    },
                    child: IconsStyle(
                      icon: Icons.favorite,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  color: Color.fromARGB(255, 197, 194, 194),
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
                        controller: searchContrroler,
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
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: FutureBuilder<List<Product>>(
                      future: fetchMyData(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: CircularProgressIndicator());
                        } else if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        } else {
                          final productList = snapshot.data;









  //  if (searchController.text.isEmpty) {
  //                       return slider(
  //                           active, index, productController.products1[index]);
  //                     }
  //
  //
  // else if (productController.products1[index].name
  //                         .toLowerCase()
  //         .contains(searchController.text.toLowerCase())) {
  //                      
  //
  //
  //
  //return slider(
  //                           active, index, productController.products1[index]);
  //                     } else {
  //                       return Container();
  //                     }






















                          return ListView.builder(
                              itemCount: productList!.length,
                              itemBuilder: ((context, index) {
                                if (searchContrroler.text.isEmpty) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(DetailScreen(
                                        index: index,
                                        product: productList[index],
                                      ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height: 200,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 241, 213, 151),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Center(
                                            child: Image.network(
                                              productList[index].image,
                                              //  fit: BoxFit.cover,
                                              height: 100,
                                              width: 100,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 220,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                BigText(
                                                  text: productList[index].name,
                                                ),
                                                Container(
                                                  child: Text(
                                                    productList[index]
                                                        .description,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: const Color
                                                            .fromARGB(255, 103,
                                                            101, 101)),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                Text("Chittagong ,Muradpur",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                AppIcon(
                                                    text: productList[index]
                                                        .rating
                                                        .toString(),
                                                    icon: Icons
                                                        .star_purple500_outlined),
                                                BigText(
                                                    text:
                                                        "\$${productList[index].price.toString()}"),
                                              ],
                                            ),
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconsStyle(
                                                  icon: Icons.favorite_border,
                                                ),
                                                IconsStyle(
                                                  icon: Icons.shopping_cart,
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                  );
                                } else if (productList[index]
                                    .name
                                    .toLowerCase()
                                    .contains(
                                        searchContrroler.text.toLowerCase())) {
                                  return GestureDetector(
                                    onTap: () {
                                      Get.to(DetailScreen(
                                        index: index,
                                        product: productList[index],
                                      ));
                                    },
                                    child: Container(
                                      margin: EdgeInsets.only(bottom: 10),
                                      height: 200,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color.fromARGB(
                                              255, 241, 213, 151),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Center(
                                            child: Image.network(
                                              productList[index].image,
                                              //  fit: BoxFit.cover,
                                              height: 100,
                                              width: 100,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Container(
                                            width: 220,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                BigText(
                                                  text: productList[index].name,
                                                ),
                                                Container(
                                                  child: Text(
                                                    productList[index]
                                                        .description,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: TextStyle(
                                                        fontSize: 12,
                                                        color: const Color
                                                            .fromARGB(255, 103,
                                                            101, 101)),
                                                    maxLines: 2,
                                                  ),
                                                ),
                                                Text("Chittagong ,Muradpur",
                                                    style: TextStyle(
                                                        fontSize: 12)),
                                                AppIcon(
                                                    text: productList[index]
                                                        .rating
                                                        .toString(),
                                                    icon: Icons
                                                        .star_purple500_outlined),
                                                BigText(
                                                    text:
                                                        "\$${productList[index].price.toString()}"),
                                              ],
                                            ),
                                          ),
                                          Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                IconsStyle(
                                                  icon: Icons.favorite_border,
                                                ),
                                                IconsStyle(
                                                  icon: Icons.shopping_cart,
                                                )
                                              ]),
                                        ],
                                      ),
                                    ),
                                  );
                                } else {
                                  return Container();
                                }
                              }));
                        }
                      })),
            ],
          ),
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
}
