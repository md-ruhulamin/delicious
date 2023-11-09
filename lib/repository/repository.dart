// Method to fetch all products
import 'package:eshop/controller/cart_controller.dart';
import 'package:eshop/controller/food_controller.dart';
import 'package:eshop/model/products_model.dart';
import 'package:get/get.dart';

class Repository {
  CartController cartController = Get.put(CartController());
  ProductController productController = Get.put(ProductController());
  @override
  void initState() {}

  List<Product> getAllProducts() {
    return productController.products1;
  }

  // Method to fetch a product by its ID
  Product getProductById(String productId) {
    return productController.products1
        .firstWhere((product) => product.id == productId);
  }
}
