import '../data/dummy/dummy_products.dart';

class HomePageController {
  void addfavorite(int id) {
    food[id].isfavorite = !food[id].isfavorite;
  }
}
