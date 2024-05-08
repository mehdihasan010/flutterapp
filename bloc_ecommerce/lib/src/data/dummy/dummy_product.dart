import '../model/product_model.dart';

final List<ProductModel> dummyProducts = [
  ProductModel(
      productName: "Mens T-Shirt",
      productPrice: 450.00,
      imageGallery: [
        ImageGallery(
            title: "Image-1",
            url: "https://fabrilife.com/products/628f71c9a6ae3-square.jpg"),
        ImageGallery(
            title: "Image-2",
            url: "https://fabrilife.com/products/6418608f79ccb-square.jpg"),
        ImageGallery(
            title: "Image-3",
            url: "https://fabrilife.com/products/60c88fa997e8c-square.jpg")
      ],
      varient: [
        Varient(category: "", item: [
          Item(title: "S", description: ""),
          Item(title: "L", description: ""),
          Item(title: "M", description: ""),
          Item(title: "XL", description: "")
        ])
      ],
      productDetails: """
Men's T-Shirt
Brand: Winner Style
Style code: MSTSW-23-579
Item code: 55628
Sleeve: Half sleeve
Fabric: 100% Cotton
Type: Round neck
Color: White (As given picture)
Size: M, L, XL, XXL
""",
      brand: "SMUG")
];
