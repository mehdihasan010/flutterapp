import 'package:flutter/material.dart';

class AddCrad extends StatelessWidget {
  const AddCrad({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff1f1f1),
      appBar: AppBar(
        title: const Text("Add Cart"),
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
