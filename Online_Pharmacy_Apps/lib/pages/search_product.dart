import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:medhealths/network/api/url_api.dart';
import 'package:medhealths/network/model/product_model.dart';
import 'package:medhealths/pages/detail_product.dart';
import 'package:medhealths/theme.dart';
import 'package:http/http.dart' as http;
import 'package:medhealths/widget/card_product.dart';
import 'package:medhealths/widget/widget_ilustration.dart';

class SearchProduct extends StatefulWidget {
  const SearchProduct({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SearchProductState createState() => _SearchProductState();
}

class _SearchProductState extends State<SearchProduct> {
  TextEditingController searchController = TextEditingController();
  List<ProductModel> listProduct = [];
  List<ProductModel> listSearchProduct = [];
  getProduct() async {
    listProduct.clear();
    var urlProduct = Uri.parse(BASEURL.getProduct);
    final response = await http.get(urlProduct);
    if (response.statusCode == 200) {
      setState(() {
        final data = jsonDecode(response.body);
        for (var product in data) {
          listProduct.add(ProductModel.fromJson(product));
        }
      });
    }
  }

  searchProduct(String text) {
    listSearchProduct.clear();
    if (text.isEmpty) {
      setState(() {});
    } else {
      for (var element in listProduct) {
        if (element.nameProduct.toLowerCase().contains(text)) {
          listSearchProduct.add(element);
        }
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  width: MediaQuery.of(context).size.width - 100,
                  height: 55,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xffe4faf0)),
                  child: TextField(
                    onChanged: searchProduct,
                    controller: searchController,
                    autofocus: true,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: const Icon(
                          Icons.search,
                          color: Color(0xffb1d8b2),
                        ),
                        hintText: "Search medicine ...",
                        hintStyle: regulerTextStyle.copyWith(
                            color: const Color(0xffb0d8b2))),
                  ),
                ),
              ],
            ),
          ),
          searchController.text.isEmpty || listSearchProduct.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 80),
                  child: WidgetIlustration(
                    title: "There is no medicine that is looking for",
                    image: "assets/no_data_ilustration.png",
                    subtitle1: "Please find the product you want,",
                    subtitle2: "the product will appear here",
                    child: SizedBox(),
                  ),
                )
              : Container(
                  padding: const EdgeInsets.all(24),
                  child: GridView.builder(
                      physics: const ClampingScrollPhysics(),
                      itemCount: listSearchProduct.length,
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16),
                      itemBuilder: (context, i) {
                        final y = listSearchProduct[i];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailProduct(y)));
                          },
                          child: CardProduct(
                            nameProduct: y.nameProduct,
                            imageProduct: y.imageProduct,
                            price: y.price,
                          ),
                        );
                      }),
                ),
        ],
      )),
    );
  }
}
