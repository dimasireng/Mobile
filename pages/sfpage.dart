import 'package:flutter/material.dart';

class Sfpage extends StatefulWidget {
  const Sfpage({super.key});

  @override
  State<Sfpage> createState() => _SfpageState();
}

class _SfpageState extends State<Sfpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Page Stateful"),
      ),
      body: Text("Berikut halaman stateful"),
    );
  }
}
