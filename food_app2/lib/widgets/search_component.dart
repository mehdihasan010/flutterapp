import 'package:flutter/material.dart';
import '../style/assets_manager.dart';

class SearchComponent extends StatelessWidget {
  const SearchComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.white,
            prefixIcon: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.search,
                size: 32,
              ),
            ),
            prefixIconColor: Colors.black.withOpacity(0.4),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(20.0),
              child: InkWell(
                  onTap: () {},
                  child: Image.asset(
                    AssetsManager.settings,
                    fit: BoxFit.fill,
                  )),
            ),
            hintText: "Search for Items",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}
