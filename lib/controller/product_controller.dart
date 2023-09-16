import 'package:get/get.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:shopping_cart/screens/firestore_db.dart';

class ProductController extends GetxController{
  final products=<Product>[].obs;
  final products1=<Product>[].obs;

  

  @override
  void onInit() {
      products.bindStream(FirestoreDB().getAllProducts());
      products1.bindStream(FirestoreDB().getAllProducts1());
    super.onInit();
    
  }
}