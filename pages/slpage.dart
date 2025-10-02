import 'package:flutter/material.dart';

class Slpage extends StatelessWidget {
  const Slpage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Halaman Stateless"),
        backgroundColor: Colors.amber,
      ),
      body: Text("Adek muncak"),
    );
  }
}
