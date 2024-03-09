import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../data/dummy/dummy_products.dart';

class MyCart extends StatefulWidget {
  const MyCart({super.key});

  @override
  State<MyCart> createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        title: const Text("My Cart"),
        elevation: 0,
        centerTitle: true,
      ),
      body: cartIdList.toList().isEmpty
          ? const Center(child: Text("No Data"))
          : Column(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: cartIdList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      food[cartIdList[index] - 1].photo),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const SizedBox(width: 12.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  food[cartIdList[index] - 1].name,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(height: 4.0),
                                Text(
                                  "\$${food[cartIdList[index] - 1].price * cartCountList[index]}", // Format price to 2 decimal places
                                  style: const TextStyle(color: Colors.grey),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    cartCountList[index] >= 2
                                        ? IconButton(
                                            onPressed: () {
                                              setState(() {});
                                            },
                                            icon: const Icon(Icons.remove),
                                            color: Colors.grey,
                                          )
                                        : const SizedBox(
                                            width: 40,
                                          ),
                                    Text("${cartCountList[index]} kg",
                                        style: const TextStyle(
                                            fontSize: 14.0,
                                            color: Colors.grey,
                                            fontWeight: FontWeight.w500)),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          //count++;
                                        });
                                      },
                                      icon: const Icon(Icons.add),
                                      color: Colors.grey,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                                onPressed: () {
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
    );
  }
}
