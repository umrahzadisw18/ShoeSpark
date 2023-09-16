import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controller/cart_controller.dart';
import 'package:shopping_cart/controller/product_controller.dart';

class KidsProducts extends StatelessWidget {
  final productController = Get.put(ProductController());
  KidsProducts({super.key});


  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Flexible(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
            itemCount: productController.products.length,
            itemBuilder: (BuildContext context, int index) =>
                CatalogCard(index: index)),
      ),
    );
  }
}

class CatalogCard extends StatelessWidget {
  final cartController = Get.put(CartController());
  final ProductController productController = Get.find();
  final int index;
  CatalogCard({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 25),
      width: 250,
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              productController.products[index].imagepath,
              height: 180,
            ),
          ),
          Text(
            productController.products[index].description,
            style: TextStyle(
              color: Colors.grey[600],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productController.products[index].name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${productController.products[index].price}',
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
                Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          bottomRight: Radius.circular(12)),
                    ),
                    child: IconButton(
                      onPressed: (){
                        cartController.addProducts(productController.products[index]);
                      },
                      icon: Icon(Icons.add),
                      color: Colors.white, 
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }
}