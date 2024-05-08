import 'package:bloc_ecommerce/src/data/model/brand_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class StoreRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<BrandModel>> fetchBrands() async {
    final List<BrandModel> brandList = [];

    final brandsSnapshot = await _firestore.collection("brand").get();

    try {
      for (var brand in brandsSnapshot.docs) {
        brandList.add(BrandModel.fromJson(brand.data()));
      }
    } catch (e) {
      throw Exception(e);
    }

    return brandList;
  }
}
