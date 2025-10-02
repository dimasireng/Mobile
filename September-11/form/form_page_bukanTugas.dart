import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  TextEditingController nim = TextEditingController();
  TextEditingController nama = TextEditingController();
  TextEditingController tgl_lahir = TextEditingController();
  TextEditingController passwd = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController hp = TextEditingController();
  TextEditingController alamat = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  String? valAgama, valJekel;
  bool membaca = false;
  bool olahraga = false;
  bool musik = false;
  bool dance = false;

  Future selectedData() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );
    if(pickDate!=null){
      tgl_lahir.text = DateFormat("dd-MM-yyyy").format(pickDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.tealAccent,
        title: Center(
          child: Text("Form Mahasiswa", style: TextStyle(color: Colors.green)),
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    "Input Data Mahasiswa",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 20),
                Text("NIM"),
                TextFormField(
                  controller: nim,
                  decoration: InputDecoration(hintText: 'ex: 2401083004'),
                  keyboardType: TextInputType.number,
                  validator: (val) {
                    return val!.isEmpty ? 'Nim tidak boleh kosong' : null;
                  },
                ),

                SizedBox(height: 20),
                Text("Nama"),
                TextFormField(
                  controller: nama,
                  decoration: InputDecoration(hintText: 'ex: David Martinez'),
                  keyboardType: TextInputType.text,
                  validator: (val) {
                    return val!.isEmpty ? 'Nama tidak boleh kosong' : null;
                  },
                ),

                SizedBox(height: 20),
                Text("Tanggal Lahir"),
                TextFormField(
                  controller: tgl_lahir,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(hintText: 'dd-MM-yyyy'),
                  onTap: (){
                    selectedData();
                  },
                  validator: (val){
                    return val!.isEmpty ? 'Tanggal Lahir tidak boleh kosong' : null;
                  },
                ),

                SizedBox(height: 20),
                Text("Password"),
                TextFormField(
                  controller: passwd,
                  decoration: InputDecoration(hintText: '*******'),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  validator: (val){
                    return val!.isEmpty ? 'Password harus di isi' : null;
                  },
                ),

                SizedBox(height: 20),
                Text("Email"),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                    hintText: 'ex: BigusDikus@gmail.com',
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (val) {
                    return val!.isEmpty ? 'Email tidak boleh kosong' : null;
                  },
                ),

                SizedBox(height: 20),
                Text("Hp"),
                TextFormField(
                  controller: hp,
                  decoration: InputDecoration(hintText: 'ex: 086969696969'),
                  keyboardType: TextInputType.phone,
                  validator: (val) {
                    return val!.isEmpty ? 'Hp tidak boleh kosong' : null;
                  },
                ),

                SizedBox(height: 20),
                Text("Alamat"),
                TextFormField(
                  controller: alamat,
                  decoration: InputDecoration(hintText: 'ex: Night City'),
                  keyboardType: TextInputType.streetAddress,
                  validator: (val) {
                    return val!.isEmpty ? 'Alamat tidak boleh kosong' : null;
                  },
                ),

                SizedBox(height: 10),
                Text("Agama"),
                Container(
                  alignment: Alignment.center,
                  height: 65,
                  child: DropdownButton(
                    value: valAgama,
                    underline: Container(),
                    isExpanded: true,
                    items: ['Islam', 'Kristen', 'Hindu', 'Budha'].map((e) {
                      return DropdownMenuItem(
                        value: e,
                        child: Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(e),
                        ),
                      );
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        valAgama = val;
                      });
                    },
                  ),
                ),

                SizedBox(height: 10),
                Text('Jenis Kelamin'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Flexible(
                      child: RadioListTile(
                        value: "Pria",
                        groupValue: valJekel.toString(),
                        onChanged: (val) {
                          setState(() {
                            valJekel = val;
                          });
                        },
                        title: Text('Pria'),
                      ),
                    ),
                    Flexible(
                      child: RadioListTile(
                        value: "Wanita",
                        groupValue: valJekel.toString(),
                        onChanged: (val) {
                          setState(() {
                            valJekel = val;
                          });
                        },
                        title: Text('Wanita'),
                      ),
                    ),
                  ],
                ),

                Text('Hobby'),
                Row(
                  children: [
                    Flexible(
                      child: CheckboxListTile(
                        value: membaca,
                        onChanged: (val) {
                          setState(() {
                            membaca = val!;
                          });
                        },
                        title: Text('Membaca'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Flexible(
                      child: CheckboxListTile(
                        value: olahraga,
                        onChanged: (val) {
                          setState(() {
                            olahraga = val!;
                          });
                        },
                        title: Text('Olahraga'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Flexible(
                      child: CheckboxListTile(
                        value: musik,
                        onChanged: (val) {
                          setState(() {
                            musik = val!;
                          });
                        },
                        title: Text('Musik'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                    Flexible(
                      child: CheckboxListTile(
                        value: dance,
                        onChanged: (val) {
                          setState(() {
                            dance = val!;
                          });
                        },
                        title: Text('Dance'),
                        controlAffinity: ListTileControlAffinity.leading,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent,
                    foregroundColor: Colors.green,
                    minimumSize: Size(double.infinity, 50),
                  ),
                  onPressed: () {
                    setState(() {
                      if (_formKey.currentState!.validate()) {
                        if ((valAgama != null) && (valJekel != null)) {
                          final pilOlahraga = [
                            if (membaca) "Membaca",
                            if (olahraga) "Olahraga",
                            if (musik) "Musik",
                            if (dance) "Dance",
                          ];
                          String _inputUser =
                              "NIM : ${nim.text}\n"
                              "Nama : ${nama.text}\n"
                              "Tanggal Lahir : ${tgl_lahir.text}\n"
                              "Password : ${passwd.text}\n"
                              "Email : ${email.text}\n"
                              "Hp : ${hp.text}\n"
                              "Alamat : ${alamat.text}\n"
                              "Agama : ${valAgama.toString()}\n"
                              "Jenis Kelamin : ${valJekel.toString()}\n"
                              "Hobby : ${pilOlahraga.join(",")}";
                          ScaffoldMessenger.of(
                            context,
                          ).showSnackBar(SnackBar(content: Text(_inputUser)));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                "Silahkan Pilih Agama dan Jenis Kelamin",
                              ),
                            ),
                          );
                        }
                      }
                    });
                  },
                  child: Text('SIMPAN'),
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
