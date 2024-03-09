import '../data/dummy/dummy_products.dart';

class MyCartController {
  void addCart(int index, int count) {
    cartIdList.add(food[index].id);
    cartCountList.add(count);
    print(cartIdList);
    print(cartCountList);
  }
}
