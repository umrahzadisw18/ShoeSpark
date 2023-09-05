import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/model/product_model.dart';

class CartController extends GetxController {
  var _products = {}.obs;

  void addProducts(Product product) {
    if (_products.containsKey(product)) {
      _products[product] += 1;
    } else {
      _products[product] = 1;
    }
    Get.snackbar(
        "Product Added", "You have added the ${product.name} to the cart",
        snackPosition: SnackPosition.TOP, duration: Duration(seconds: 2));
  }

  get products => _products;

  void removeProducts(Product product) {
    if (_products.containsKey(product) && _products[product] == 1) {
      _products.removeWhere((key, value) => Key == product);
    } else {
      _products[product] -= 1;
    }
  }

  get productSubtotal => _products.entries
      .map((product) => product.key.price * product.value)
      .toList();

  get total => _products.entries
      .map((product) => product.key.price * product.value)
      .toList()
      .reduce((value, element) => value+element)
      .toStringAsFixed(2);
    
}
