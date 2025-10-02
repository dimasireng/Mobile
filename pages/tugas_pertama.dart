import 'package:flutter/material.dart';

class TugasPertama extends StatefulWidget {
  const TugasPertama({super.key});

  @override
  State<TugasPertama> createState() => _LatihanPertamapage();
}

class _LatihanPertamapage extends State<TugasPertama> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teknologi Informasi"),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        color: Colors.yellow,
        width: 1550,
        height: 500,
        child: Center(
          child: Column(
            children: [
              Icon(Icons.network_wifi, color: Colors.white, size: 200),
              Text(
                "Teknologi Informasi adalah bidang yang berkaitan dengan penggunaan sistem komputer, perangkat keras, perangkat lunak, dan jaringan untuk membuat, mengubah, menyimpan, mengelola, mengamankan, dan menyebarkan informasi secara efisien.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 20,
                  fontFamily: "serif",
                  backgroundColor: Colors.yellow,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
