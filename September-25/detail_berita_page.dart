import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class DetailBeritaPage extends StatelessWidget {
  final Map<String, dynamic> itemBerita;

  const DetailBeritaPage(this.itemBerita, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Center(
          child: Text(
            itemBerita['Judul'],
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
                image: NetworkImage(itemBerita['Gambar']),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 300,
              ),
            ),
            SizedBox(height: 10,),
            Text(itemBerita['Judul'],
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            Text(itemBerita['Tanggal'],
              style: TextStyle(fontSize: 10),
            ),
            RatingBarIndicator(
              itemBuilder: (context, index) =>
                  Icon(Icons.star, color: Colors.greenAccent),
              rating: itemBerita['Rating'],
              itemCount: 10,
              itemSize: 15,
              direction: Axis.horizontal,
            ),
            SizedBox(height: 12,),
            Text(itemBerita['Isi']),
          ],
        ),
      ),
    );
  }
}
