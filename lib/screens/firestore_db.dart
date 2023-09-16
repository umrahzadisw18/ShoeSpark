import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shopping_cart/model/product_model.dart';

class FirestoreDB{
  final FirebaseFirestore _firebaseFirestore=  FirebaseFirestore.instance;
  Stream<List<Product>> getAllProducts(){
    return _firebaseFirestore.collection('products')
    .snapshots()
    .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
  Stream<List<Product>> getAllProducts1(){
    return _firebaseFirestore.collection('products1')
    .snapshots()
    .map((snapshot) {
      return snapshot.docs.map((doc) => Product.fromSnapshot(doc)).toList();
    });
  }
}