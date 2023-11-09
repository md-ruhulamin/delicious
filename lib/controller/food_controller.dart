// ignore_for_file: unused_element, avoid_print, empty_catches, curly_braces_in_flow_control_structures, prefer_interpolation_to_compose_strings, prefer_final_fields, unused_field, unnecessary_cast

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:eshop/model/products_model.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  List<Product> _productList = [];
  List<Product> get productList => _productList;

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  final products = <Product>[].obs;

  Future<void> fetchProducts() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('products').get();
      products.assignAll(querySnapshot.docs.map((doc) {
        final id = doc.id;
        final data = doc.data() as Map<String, dynamic>;
        _isLoaded = true;
        return Product.fromMap(data, id);
      }));
    } catch (e) {
      // Handle any potential errors or exceptions here
    }
  }

  get getproducts => products;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final RxList<Product> products1 = <Product>[].obs;
  final RxList<String> favouriteList = <String>[].obs;
  final RxBool isLoading = true.obs;
  final RxBool hasError = false.obs;
  final RxString error = ''.obs;

  void markasFavourite(String id) {
    favouriteList.addIf(!favouriteList.contains(id), id);
    print(favouriteList.length);
    update();
  }


  bool isFavourite(String product) {
    return isFavourite(product);
  }

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final QuerySnapshot querySnapshot =
          await _firestore.collection('products').get();

      final List<Product> productList =
          querySnapshot.docs.map((doc) => Product.fromFirestore(doc)).toList();

      products1.assignAll(productList);
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      hasError.value = true;
      error.value = 'Error: $e';
    }
  }
}
