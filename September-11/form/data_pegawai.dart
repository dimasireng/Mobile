import 'package:flutter/material.dart';

class DataPegawai extends StatelessWidget {
  final String nip, nama, jabatan, pangkat, valAgama;
  const DataPegawai(this.nip, this.nama, this.jabatan, this.pangkat, this.valAgama,
      {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
          "Data Pegawai",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              "Data Pegawai ",
              style: TextStyle(fontSize: 34),
            ),
          ),
          SizedBox(height: 15),
          Text("NIP: $nip", style: TextStyle(fontSize: 15)),
          Text("Nama: $nama", style: TextStyle(fontSize: 15)),
          Text("Jabatan: $jabatan", style: TextStyle(fontSize: 15)),
          Text("Pangkat: $pangkat", style: TextStyle(fontSize: 15)),
          Text("Agama: $valAgama", style: TextStyle(fontSize: 15))

        ],
      ),
    );
  }
}