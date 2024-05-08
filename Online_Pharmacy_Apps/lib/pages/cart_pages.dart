// ignore_for_file: library_private_types_in_public_api, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medhealths/main_page.dart';
import 'package:medhealths/network/api/url_api.dart';
import 'package:medhealths/network/model/cart_model.dart';
import 'package:medhealths/network/model/pref_profile_model.dart';
import 'package:medhealths/pages/success_checkout.dart';
import 'package:medhealths/theme.dart';
import 'package:medhealths/widget/button_primary.dart';
import 'package:medhealths/widget/widget_ilustration.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class CartPages extends StatefulWidget {
  final VoidCallback method;
  const CartPages(this.method, {super.key});
  @override
  _CartPagesState createState() => _CartPagesState();
}

class _CartPagesState extends State<CartPages> {
  final price = NumberFormat("#,##0", "EN_US");
  late String userID, fullName, address, phone;
  int delivery = 0;
  Future<void> getPref() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState(() {
      userID = sharedPreferences.getString(PrefProfile.idUSer)!;
      fullName = sharedPreferences.getString(PrefProfile.name)!;
      address = sharedPreferences.getString(PrefProfile.address)!;
      phone = sharedPreferences.getString(PrefProfile.phone)!;
    });
    getCart();
    cartTotalPrice();
  }

  List<CartModel> listCart = [];
  Future<void> getCart() async {
    listCart.clear();
    var urlGetCart = Uri.parse(BASEURL.getProductCart + userID);
    final response = await http.get(urlGetCart);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        for (Map item in data) {
          listCart.add(CartModel.fromJson(item));
        }
      });
    }
  }

  Future<void> updateQuantity(String tipe, String model) async {
    var urlUpdateQuantity = Uri.parse(BASEURL.updateQuantityProductCart);
    final response = await http
        .post(urlUpdateQuantity, body: {"cartID": model, "tipe": tipe});
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      print(message);
      setState(() {
        getPref();
        widget.method();
      });
    } else {
      print(message);
      setState(() {
        getPref();
      });
    }
  }

  Future<void> checkout() async {
    var urlCheckout = Uri.parse(BASEURL.checkout);
    final response = await http.post(urlCheckout, body: {
      "idUser": userID,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      Navigator.pushAndRemoveUntil(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const SuccessCheckout()),
          (route) => false);
    } else {
      print(message);
    }
  }

  var sumPrice = "0";
  int totalPayment = 0;
  Future<void> cartTotalPrice() async {
    var urlTotalPrice = Uri.parse(BASEURL.totalPriceCart + userID);
    final response = await http.get(urlTotalPrice);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String total = data['Total'];
      setState(() {
        sumPrice = total;
        totalPayment = int.parse(sumPrice) + delivery;
      });
      print(sumPrice);
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: listCart.isEmpty
          ? const SizedBox()
          : Container(
              padding: const EdgeInsets.all(24),
              height: 250,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Color(0xfffcfcfc),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Items",
                        style: regulerTextStyle.copyWith(
                            fontSize: 16, color: greyBoldColor),
                      ),
                      Text(
                        "TK ${price.format(int.parse(sumPrice))}",
                        style: boldTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Delivery Fee",
                        style: regulerTextStyle.copyWith(
                            fontSize: 16, color: greyBoldColor),
                      ),
                      Text(
                        delivery == 0 ? "FREE" : delivery as String,
                        style: boldTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Payment",
                        style: regulerTextStyle.copyWith(
                            fontSize: 16, color: greyBoldColor),
                      ),
                      Text(
                        "TK ${price.format(totalPayment)}",
                        style: boldTextStyle.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: ButtonPrimary(
                      onTap: () {
                        checkout();
                      },
                      text: "CHECKOUT NOW",
                    ),
                  )
                ],
              ),
            ),
      body: SafeArea(
          child: ListView(
        padding: const EdgeInsets.only(bottom: 100),
        children: [
          Container(
              padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
              height: 70,
              child: Row(children: [
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 32,
                    color: greenColor,
                  ),
                ),
                const SizedBox(
                  width: 30,
                ),
                Text(
                  "My Cart",
                  style: regulerTextStyle.copyWith(fontSize: 25),
                )
              ])),
          listCart.isEmpty
              ? Container(
                  padding: const EdgeInsets.all(24),
                  margin: const EdgeInsets.only(top: 30),
                  child: WidgetIlustration(
                    image: "assets/empty_cart_ilustration.png",
                    title: "Oops, there are no products in your cart",
                    subtitle1: "Your cart is still empty, browse the",
                    subtitle2: "attractive products from medhealths",
                    child: Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      child: ButtonPrimary(
                        text: "SHOPPING NOW",
                        onTap: () {
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MainPages()),
                              (route) => false);
                        },
                      ),
                    ),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(24),
                  //height: 170,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivery Destination",
                        style: regulerTextStyle.copyWith(fontSize: 18),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Name",
                            style: regulerTextStyle.copyWith(
                                fontSize: 16, color: greyBoldColor),
                          ),
                          Text(
                            fullName,
                            style: boldTextStyle.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Address",
                            style: regulerTextStyle.copyWith(
                                fontSize: 16, color: greyBoldColor),
                          ),
                          Text(
                            address,
                            style: boldTextStyle.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Phone",
                            style: regulerTextStyle.copyWith(
                                fontSize: 16, color: greyBoldColor),
                          ),
                          Text(
                            phone,
                            style: boldTextStyle.copyWith(fontSize: 16),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
          ListView.builder(
              itemCount: listCart.length,
              shrinkWrap: true,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, i) {
                final x = listCart[i];
                return Container(
                  padding: const EdgeInsets.all(24),
                  color: whiteColor,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.network(
                            x.image,
                            width: 115,
                            height: 100,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 200,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  x.name,
                                  style:
                                      regulerTextStyle.copyWith(fontSize: 16),
                                ),
                                Row(
                                  children: [
                                    IconButton(
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: greenColor,
                                        ),
                                        onPressed: () {
                                          updateQuantity("tambah", x.idCart);
                                        }),
                                    Text(x.quantity),
                                    IconButton(
                                        icon: const Icon(
                                          Icons.remove_circle,
                                          color: Color(0xfff0997a),
                                        ),
                                        onPressed: () {
                                          updateQuantity("kurang", x.idCart);
                                        }),
                                  ],
                                ),
                                Text(
                                  "TK ${price.format(int.parse(x.price))}",
                                  style: boldTextStyle.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider()
                    ],
                  ),
                );
              })
        ],
      )),
    );
  }
}
