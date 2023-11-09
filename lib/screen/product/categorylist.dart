// ignore_for_file: prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/controller/cart_controller.dart';
import 'package:eshop/controller/food_controller.dart';
import 'package:eshop/screen/product/details_page.dart';
import 'package:eshop/model/products_model.dart';
import 'package:eshop/widget/appicon.dart';
import 'package:eshop/widget/bigText.dart';
import 'package:eshop/widget/icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPageState createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  final productController = Get.find<ProductController>();
  final cartcontroller = Get.find<CartController>();
  int selectedCategory = 0; // Default to the first category
  TextEditingController searchContrroler = TextEditingController();
  List<String> categories = [
    "All",
    "Pizza",
    "Biriany",
    "Juice",
    "Cake",
    "Noodles",
  ]; // Your category list
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    fetchMyData("Biriani");
    productController.favouriteList;
    print(productController.favouriteList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filter by Category'),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15, right: 15, top: 20),
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                for (int i = 0; i < categories.length; i++)
                  i == selectedCategory
                      ? Container(
                          margin: EdgeInsets.only(right: 5),
                          padding:
                              EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.amber),
                          child: Text(categories[i]))
                      : Container(
                          margin: EdgeInsets.only(right: 5),
                          padding:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Color.fromARGB(255, 196, 195, 197)),
                          child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedCategory = i;
                                });
                              },
                              child: Text(categories[i])))
              ]),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: FutureBuilder<List<Product>>(
                    future: fetchMyData(categories[selectedCategory]),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else {
                        final productList = snapshot.data;

                        return productList!.isEmpty
                            ? Center(
                                child: Text("The is no item of this category"),
                              )
                            : GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        mainAxisSpacing: 10,
                                        crossAxisSpacing: 10,
                                        childAspectRatio: 0.6,
                                        crossAxisCount: 2),
                                itemCount: productList.length,
                                itemBuilder: ((context, index) {
                                  if (searchContrroler.text.isEmpty) {
                                    return productList.isEmpty
                                        ? const Center(child: Text("No Match"))
                                        : GestureDetector(
                                            onTap: () {
                                              Get.to(DetailScreen(
                                                index: index,
                                                product: productList[index],
                                              ));
                                            },
                                            child: SizedBox(
                                              height: 100,
                                              width: 100,
                                              child: Container(
                                                margin:
                                                    EdgeInsets.only(bottom: 10),
                                                padding:
                                                    const EdgeInsets.all(10),
                                                decoration: BoxDecoration(
                                                    color: Colors.white,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10)),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Obx(() {
                                                      return Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                print(cartcontroller
                                                                    .favouriteItems
                                                                    .length);
                                                                cartcontroller
                                                                    .addToFavorite(
                                                                        productList[index]
                                                                            .id);
                                                              },
                                                              child: cartcontroller
                                                                      .favouriteItems
                                                                      .containsKey(
                                                                          productList[index]
                                                                              .id)
                                                                  ? IconsStyle(
                                                                      icon: Icons
                                                                          .favorite,
                                                                    )
                                                                  : IconsStyle(
                                                                      icon: Icons
                                                                          .favorite_border,
                                                                    ),
                                                            ),
                                                            IconsStyle(
                                                              icon: Icons
                                                                  .shopping_cart,
                                                            )
                                                          ]);
                                                    }),
                                                    // Row(
                                                    //     mainAxisAlignment:
                                                    //         MainAxisAlignment
                                                    //             .spaceBetween,
                                                    //     children: [

                                                    //       GestureDetector(
                                                    //         onTap: () {
                                                    //           cartcontroller
                                                    //               .addToFavorite(
                                                    //                   productList[
                                                    //                           index]
                                                    //                       .id);
                                                    //         },
                                                    //         child: cartcontroller
                                                    //                 .favouriteItems
                                                    //                 .containsKey(
                                                    //                     productList[index]
                                                    //                         .id)
                                                    //             ?  IconsStyle(
                                                    //                 icon: Icons
                                                    //                     .favorite,
                                                    //               )
                                                    //             : IconsStyle(
                                                    //                 icon: Icons
                                                    //                     .favorite_border,
                                                    //               ),
                                                    //       ),
                                                    //       IconsStyle(
                                                    //         icon: Icons
                                                    //             .shopping_cart,
                                                    //       )
                                                    //     ]),
                                                    Center(
                                                        child:
                                                         Image.network(
                                                          productList[index]
                                                              .image,
                                                          //  fit: BoxFit.cover,
                                                          height: 100,
                                                          width: 100,
                                                        ),
                                                        ),
                                                    const SizedBox(
                                                      width: 8,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          productList[index]
                                                              .name,
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 16),
                                                        ),
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            AppIcon(
                                                                text: productList[
                                                                        index]
                                                                    .rating
                                                                    .toString(),
                                                                icon: Icons
                                                                    .star_purple500_outlined),
                                                            BigText(
                                                                text:
                                                                    "\$${productList[index].price.toString()}"),
                                                          ],
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ));
                                    //    }
                                  }
                                }));
                      }
                    })),
          ],
        ),
      ),
    );
  }

  Future<List<Product>> fetchMyData(String category) async {
    final QuerySnapshot querySnapshot;
    if (category == "All") {
      querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();
    } else {
      querySnapshot = await FirebaseFirestore.instance
          .collection('products')
          .where('category', isEqualTo: category)
          .get();
    }

    return querySnapshot.docs.map((doc) {
      final id = doc.id;
      final data = doc.data() as Map<String, dynamic>;
      return Product.fromMap(data, id);
    }).toList();
  }

  final List<String> favouriteList = [];

  void markasFavourite(String id) {
    favouriteList.addIf(!favouriteList.contains(id), id);
  }

  bool isFavourite(String product) => isFavourite(product);
}
