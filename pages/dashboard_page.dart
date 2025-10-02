import 'package:flutter/material.dart';
import 'list_pegawai_page.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: const Center(
          child: Text("Dashboard", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/tambahPegawai');
                },
                child: const Text("Tambah Pegawai"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const ListPegawaiPage(
                        "6767 6969 1331",
                        "Dimas Ambubu",
                        "30 Februari 2005",
                        "Jomokerto",
                        "Jl. Martinez No. 12, Night City",
                        "0895-4145-82035"
                    )),
                  );
                },
                child: const Text("List Pegawai"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}