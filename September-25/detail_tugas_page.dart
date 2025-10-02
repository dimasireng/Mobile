import 'package:flutter/material.dart';


class DetailCyberPage extends StatelessWidget {
  final Map<String, dynamic> itemCyber;

  const DetailCyberPage(this.itemCyber, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Center(
          child: Text(
            itemCyber['NIM'],
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: NetworkImage(itemCyber['Gambar']),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
            SizedBox(height: 10,),
            Text(itemCyber['NIM'],
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            Text(itemCyber['Email'],
              style: TextStyle(fontSize: 10),
            ),
            Text("Nilai: ${itemCyber['Intelegence']}".toString(),
              style: TextStyle(fontSize: 10),
            ),
            SizedBox(height: 12,),
            Text(itemCyber['Nama']),
            SizedBox(height: 5),
            Text(itemCyber['Isi'])
          ],
        ),
      ),
    );
  }
}
