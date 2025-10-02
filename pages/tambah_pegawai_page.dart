import 'package:flutter/material.dart';

class TambahPegawaiPage extends StatelessWidget {
  const TambahPegawaiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text(
            "Tambah Pegawai",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "Tambah Pegawai",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}