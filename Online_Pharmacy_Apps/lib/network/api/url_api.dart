class BASEURL {
  static String ipAddress = "mehdihealth.000webhostapp.com";
  static String apiRegister = "http://$ipAddress/register.php";
  static String apiLogin = "http://$ipAddress/login.php";
  static String categoryWithProduct =
      "http://$ipAddress/get_product_with_category.php";
  static String getProduct = "http://$ipAddress/get_product.php";
  static String addToCart = "http://$ipAddress/add_cart.php";
  static String getProductCart = "http://$ipAddress/get_cart.php?userID=";
  static String updateQuantityProductCart =
      "http://$ipAddress/update_quantity.php";
  static String totalPriceCart =
      "http://$ipAddress/get_total_price.php?userID=";
  static String getTotalCart = "http://$ipAddress/total_cart.php?userID=";
  static String checkout = "http://$ipAddress/checkout.php";
  static String historyOrder = "http://$ipAddress/get_history.php?id_user=";
}
