import 'dart:convert';

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  RxMap<String, int> cartItems = <String, int>{}.obs;
  RxMap<String, int> favouriteItems = <String, int>{}.obs;

  void addToCart(String productId) {
    if (cartItems.containsKey(productId)) {
      cartItems[productId] = (cartItems[productId] ?? 0) + 1;
    } else {
      cartItems[productId] = 1;
    }
    saveCartData();
  }

  void addToFavorite(String productId) {
    if (favouriteItems.containsKey(productId)) {
      favouriteItems[productId] = 0;
      favouriteItems.remove(productId);
    } else {
      favouriteItems[productId] = 1;
    }
    saveFavouriteItem();
  }

  void removeFromCart(String productId) {
    if (cartItems.containsKey(productId)) {
      if (cartItems[productId] != null && cartItems[productId]! > 1) {
        cartItems[productId] = cartItems[productId]! - 1;
      } else {
        cartItems.remove(productId);
      }
    }
    saveCartData();
  }

  int getQuantity(String productId) {
    return cartItems[productId] ?? 0;
  }

  int getTotalQuantity() {
    int total = 0;
    for (var quantity in cartItems.values) {
      total += quantity;
    }
    return total;
  }

  Map<String, int> get cart => cartItems;
  Map<String, int> get favorite => favouriteItems;

  // Save cart data to SharedPreferences
  Future<void> saveCartData() async {
    final prefs = await SharedPreferences.getInstance();
    final cartMap = cartItems.value; // Convert the RxMap to a regular Map
    final cartData = jsonEncode(cartMap); // Convert the Map to a JSON string
    prefs.setString('cart', cartData);
  }

  Future<void> saveFavouriteItem() async {
    final prefs = await SharedPreferences.getInstance();
    final favitemmap =
        favouriteItems.value; // Convert the RxMap to a regular Map
    final favouriteitemData =
        jsonEncode(favitemmap); // Convert the Map to a JSON string
    prefs.setString('favoriteItem', favouriteitemData);
    update();
  }

  RxBool isContainets(String id) {
    RxBool result = false as RxBool;
    result = cartItems.containsValue(id) as RxBool;
    return result;
  }
}
