class ItemModel {
  final int id;
  final String name;
  final String details;
  final double price;
  final String photo;
  bool isfavorite;

  ItemModel(
      {required this.id,
      required this.name,
      required this.details,
      required this.price,
      required this.isfavorite,
      required this.photo});
}
