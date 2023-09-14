import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/widget/cart_product.dart';
import 'package:shopping_cart/widget/cart_total.dart';

class CartScreen extends StatelessWidget {
  final product= {}.obs;
  CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      color: Colors.grey[300],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,   
        children: [
          Flexible(child: CartProducts()),
          Flexible(child: CartTotal()),
        ],
      ),
    
    );
  }
}
