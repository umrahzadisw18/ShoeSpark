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
    Scaffold(
         backgroundColor: Colors.grey[300],
      appBar: AppBar(
         title: Center(child: Text("My Cart",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          )),
          backgroundColor: Colors.transparent,
          elevation: 0,
      ),
      body: Container(
        color: Colors.grey[300],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,   
          children: [
            Flexible(child: CartProducts()),
            Flexible(child: CartTotal()),
          ],
        ),
      
      ),
    );
  }
}
