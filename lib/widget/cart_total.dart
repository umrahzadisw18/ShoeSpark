import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controller/cart_controller.dart';

class CartTotal  extends StatelessWidget {
  final CartController controller = Get.find();
  CartTotal ({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => 
      Container(
        padding: EdgeInsets.symmetric(horizontal: 35,),
        margin: EdgeInsets.only(bottom: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Total:',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
            Text('\$${controller.total}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),),
          ],
        ),
      ),
    );
  }
}