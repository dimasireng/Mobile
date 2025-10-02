import 'package:flutter/material.dart';

class FormPegawai extends StatefulWidget {
  const FormPegawai({super.key});

  @override
  State<FormPegawai> createState() => _FormPageState();
}

class _FormPageState extends State<FormPegawai> {
  TextEditingController nip = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController jabatan = TextEditingController();
  TextEditingController pangkat = TextEditingController();

  final formKey = GlobalKey<FormState>();
  String? valStatus;
  bool sma = false;
  bool diii = false;
  bool div = false;
  bool ss = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Center(
          child: Text("Form Pegawai", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Input data Pegawai",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Text("NIP:"),
                TextFormField(
                  controller: nip,
                  decoration: InputDecoration(hintText: "ex: 9955 5245 24542"),
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    return val!.isEmpty ? "NIP tidak boleh kosong" : null;
                  },
                ),
                SizedBox(height: 20),
                Text("Nama:"),
                TextFormField(
                  controller: nama,
                  decoration: InputDecoration(hintText: "ex: David Martinez"),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    return val!.isEmpty ? "Nama tidak boleh kosong" : null;
                  },
                ),
                SizedBox(height: 20),
                Text("Jabatan:"),
                TextFormField(
                  controller: jabatan,
                  decoration: InputDecoration(hintText: "Asisten Ahli"),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    return val!.isEmpty ? "Jabatan tidak boleh kosong" : null;
                  },
                ),
                SizedBox(height: 20),
                Text("Pangkat:"),
                TextFormField(
                  controller: pangkat,
                  decoration: InputDecoration(hintText: "A3"),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    return val!.isEmpty ? "Pangkat tidak boleh kosong" : null;
                  },
                ),
                SizedBox(height: 20),
                Text("Status:"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: RadioListTile(
                        value: "PNS",
                        groupValue: valStatus.toString(),
                        onChanged: (val) {
                          setState(() {
                            valStatus = val;
                          });
                        },
                        title: Text("PNS"),
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        value: "P3K",
                        groupValue: valStatus.toString(),
                        onChanged: (val) {
                          setState(() {
                            valStatus = val;
                          });
                        },
                        title: Text("P3K"),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text("Pendidikan:"),
                CheckboxListTile(
                  value: sma,
                  onChanged: (val) {
                    setState(() {
                      sma = val!;
                    });
                  },
                  title: Text("SMA"),
                ),
                CheckboxListTile(
                  value: diii,
                  onChanged: (val) {
                    setState(() {
                      diii = val!;
                    });
                  },
                  title: Text("DIII"),
                ),CheckboxListTile(
                  value: div,
                  onChanged: (val) {
                    setState(() {
                      div = val!;
                    });
                  },
                  title: Text("DIV/S1"),
                ),CheckboxListTile(
                  value: ss,
                  onChanged: (val) {
                    setState(() {
                      ss = val!;
                    });
                  },
                  title: Text("S2"),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    setState(() {
                      if (formKey.currentState!.validate()) {
                        final pilihPendik = [
                          if(sma) "SMA",
                          if(diii) "DIII",
                          if(div) "DIV/S1",
                          if(ss) "S2",
                        ];
                        String inputUser =
                            "NIP: ${nip.text}\n"
                            "Nama: ${nama.text}\n"
                            "Jabatan: ${jabatan.text}\n"
                            "Pangkat: ${pangkat.text}\n"
                            "Status: ${valStatus.toString()}\n"
                            "Pendidikan : ${pilihPendik.join(", ")}"
                        ;
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(SnackBar(content: Text(inputUser)));
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Silahkan Pilih Agama dan Jenis Kelamin')),
                        );
                      }
                    });
                  },
                  child: Text("Simpan"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// LAST UPDATED 16-September-2025