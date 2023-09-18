import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controller/cart_controller.dart';
import 'package:shopping_cart/model/product_model.dart';

class CartProducts extends StatelessWidget {
  final CartController controller = Get.find();
  CartProducts({super.key});


  @override
  Widget build(BuildContext context) {
    return Obx(() => 
    controller.products.length == 0
          ? Align(
            alignment: Alignment.bottomCenter,
            child:Text("Cart is Empty", style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
            // Image.asset("images/Cart-empty.png",height: 250, width: 250,)
            )
      : SizedBox(
        height:600,
        child: ListView.builder(
            itemCount: controller.products.length,
            itemBuilder: (BuildContext context, int index) {
              return CartProductCard(
                controller: controller,
                product: controller.products.keys.toList()[index],
                quantity: controller.products.values.toList()[index],
                index: index,
              );
            }),
      ),
    );
  }
}

class CartProductCard extends StatelessWidget {
  final CartController controller;
  final Product product;
  final int quantity;
  final int index;
  CartProductCard(
      {super.key,
      required this.controller,
      required this.product,
      required this.quantity,
      required this.index});

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: Container(
        decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(10),
      ),
        margin: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage: NetworkImage(product.imagepath,),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(child: Text(product.name, 
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold ),)),
            IconButton(onPressed: () {
              controller.removeProducts(product);
            },
            icon: Icon(Icons.remove_circle)),
            Text('${quantity}'),
            IconButton(onPressed: () {
              controller.addProducts(product);
            }, 
            icon: Icon(Icons.add_circle)),
          ],
        ),
      ),
    );
  }
}
