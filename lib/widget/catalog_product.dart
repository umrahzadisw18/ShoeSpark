import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_cart/controller/cart_controller.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:shopping_cart/screens/firestore_db.dart';

class CatalogProducts extends StatelessWidget {
    final cartController = Get.put(CartController());
  CatalogProducts({super.key});

    @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: FirestoreDB1().getProductsByCategory('women'),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Display a loading indicator while data is loading.
          }
          if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}');
          }
          if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
            return Text(
                'No products available for Men.'); // Display a message when there are no products.
          }
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (context, index) {
                  final productDoc = snapshot.data!.docs[index];
                  final productData = productDoc.data()
                      as Map<String, dynamic>; // Cast to the expected type.

                  // Create a Product instance from the retrieved data.
                  final product = Product.fromFirestore(productData);

                  // Create and return widgets to display product details.
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
                            product.imagepath,
                            height: 150,
                          ),
                        ),
                        Text(
                          product.description,
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
                                    product.name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text(
                                    '\$${product.price}',
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
                                    onPressed: () {
                          cartController.addProducts(product);
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
                }),
          );
        });
  }
}

// class CatalogCard extends StatelessWidget {
//   final cartController = Get.put(CartController());
//   final ProductController productController = Get.find();
//   final int index;
//   CatalogCard({super.key, required this.index});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.only(left: 25),
//       width: 250,
//       decoration: BoxDecoration(
//         color: Colors.grey[100],
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           ClipRRect(
//             borderRadius: BorderRadius.circular(12),
//             child: Image.network(
//               productController.products[index].imagepath,
//               height: 180,
//             ),
//           ),
//           Text(
//             productController.products[index].description,
//             style: TextStyle(
//               color: Colors.grey[600],
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(left: 25.0),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       productController.products[index].name,
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 20,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Text(
//                       '${productController.products[index].price}',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   ],
//                 ),
//                 Container(
//                     padding: EdgeInsets.all(10),
//                     decoration: BoxDecoration(
//                       color: Colors.black,
//                       borderRadius: BorderRadius.only(
//                           topLeft: Radius.circular(12),
//                           bottomRight: Radius.circular(12)),
//                     ),
//                     child: IconButton(
//                       onPressed: (){
//                         cartController.addProducts(productController.products[index]);
//                       },
//                       icon: Icon(Icons.add),
//                       color: Colors.white, 
//                     )),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
