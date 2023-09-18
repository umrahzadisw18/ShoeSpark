import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_cart/model/product_model.dart';



class FirestoreDB{
  final FirebaseFirestore _firebaseFirestore=  FirebaseFirestore.instance;
  Stream<List<Product>> getAllProducts(String category){
    return _firebaseFirestore.collection('products')
    .where('category', isEqualTo: category)
    .snapshots()
    .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}