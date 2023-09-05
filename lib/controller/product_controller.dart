import 'package:get/get.dart';
import 'package:shopping_cart/model/product_model.dart';
import 'package:shopping_cart/screens/firestore_db.dart';

class ProductController extends GetxController{
  final products=<Product>[].obs;

  @override
  void onInit() {
      products.bindStream(FirestoreDB().getAllProducts());
    super.onInit();
    
  }
}