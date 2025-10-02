import 'package:flutter/material.dart';

class StyleTextIcon extends StatelessWidget {
  const StyleTextIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text("Mengatur : Style, Text, dan Icon"),
      ),
      body: Container(
        color: Colors.greenAccent,
        width: 200,
        height: 100,
        child: Center(
          // child: Text(
          //   "Tutorial FLutter",
          //   style: TextStyle(
          //     color: Colors.orange,
          //     fontFamily: "serif",
          //     fontSize: 60
          //   ),
          // ),
          child: Icon(Icons.check,color: Colors.white),
        ),
      ),
    );
  }
}
