import 'package:flutter/material.dart';
import 'package:task_2/style/assets_manager.dart';
import 'package:task_2/widget/item_widget.dart';

class HeaderComponent extends StatelessWidget {
  const HeaderComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
            decoration: InputDecoration(
          prefixIcon: Image.asset(AssetsManager.vector_5),
          suffixIcon: Image.asset(AssetsManager.vector_6),
          hintText: 'Where to? Anywhere, Anytime, Add guest',
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(100))),
        )),
        const SizedBox(
          height: 20,
        ),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ItemWidget(text: 'OMG!', image: AssetsManager.vector),
              ItemWidget(text: 'Beach', image: AssetsManager.vector_1),
              ItemWidget(text: 'Pools', image: AssetsManager.vector_2),
              ItemWidget(text: 'Islands', image: AssetsManager.vector_3),
              ItemWidget(text: 'OMG!', image: AssetsManager.vector_3),
              ItemWidget(text: 'Beach', image: AssetsManager.vector_2)
            ],
          ),
        )
      ],
    );
  }
}
