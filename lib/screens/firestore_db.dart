import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreDB1 {
  final CollectionReference productsCollection =
      FirebaseFirestore.instance.collection('products');

  // Stream to get all products
  Stream<QuerySnapshot> getAllProducts() {
    return productsCollection.snapshots();
  }

  // Stream to get products by category
  Stream<QuerySnapshot> getProductsByCategory(String category) {
    return productsCollection
        .where('category', isEqualTo: category)
        .snapshots();
  }
}

// class FirestoreDB{
//   final FirebaseFirestore _firebaseFirestore=  FirebaseFirestore.instance;
//   Stream<List<Product>> getAllProducts(String category){
//     return _firebaseFirestore.collection('products')
//     .where('category', isEqualTo: category)
//     .snapshots()
//     .map((snapshot) {
//       return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
//     });
//   }
//}