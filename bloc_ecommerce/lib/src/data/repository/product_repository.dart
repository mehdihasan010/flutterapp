import 'package:bloc_ecommerce/src/data/dummy/dummy_product.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProductRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  Future<void> fetchProduct() async {}

  Future<void> createProduct() async {
    try {
      for (var product in dummyProducts) {
        await _firestore.collection("products").add(product.toJson());
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
