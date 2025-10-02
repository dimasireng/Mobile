import 'package:flutter/material.dart';

class ListPegawaiPage extends StatelessWidget {
  final String nip;
  final String nama;
  final String tanggal_lahir;
  final String tempat_lahir;
  final String alamat;
  final String no_hp;

  const ListPegawaiPage(
      this.nip,
      this.nama,
      this.tanggal_lahir,
      this.tempat_lahir,
      this.alamat,
      this.no_hp, {
        super.key,
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text("List Pegawai", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.purple,
              width: 300,
              height: 88,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.accessible, color: Colors.amber),
                      Text(
                        "NIP : $nip",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.purpleAccent,
              width: 300,
              height: 88,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  //dibagian sebelum text tambahkan icon, jangan ubah kodingan yang ada
                  child: Column(
                    children: [
                      Icon(
                        Icons.accessibility_new_outlined,
                        color: Colors.teal,
                      ),
                      Text(
                        "Nama : $nama",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.blue,
              width: 300,
              height: 88,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Center(
                  child: Column(
                    children: [
                      Icon(
                        Icons.add_business_outlined,
                        color: Colors.lightGreen,
                      ),
                      Text(
                        "Tanggal Lahir : $tanggal_lahir",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Container(
              color: Colors.blueAccent,
              width: 300,
              height: 88,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.account_balance_rounded, color: Colors.white),
                      Text(
                        "Tempat Lahir : $tempat_lahir",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.lightBlueAccent,
              width: 300,
              height: 88,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.ac_unit_outlined, color: Colors.purple),
                      Text(
                        "Alamat : $alamat ",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Container(
              color: Colors.cyanAccent,
              width: 300,
              height: 88,
              child: Padding(
                padding: const EdgeInsets.all(9.0),
                child: Center(
                  child: Column(
                    children: [
                      Icon(Icons.adb, color: Colors.grey),
                      Text(
                        "No HP : $no_hp",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}