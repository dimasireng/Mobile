import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:snap/25Sep/detail_berita_page.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<Map<String, dynamic>> listBerita = [
    {
      "Judul": "Judul Berita Satu",
      "Isi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l",
      "Tanggal": "25 September 2025",
      "Gambar":
          "https://imgs.search.brave.com/xFdyqoEYLRqt7i9-HTCvuHU4_mOWSBgs33OFuMJWtOU/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly90My5m/dGNkbi5uZXQvanBn/LzAwLzQ3LzU0LzYy/LzM2MF9GXzQ3NTQ2/MjAxX1VtUDZ0UTND/dUd1QW5aMDdNc2tv/NFVFajlVa3c2R2xS/LmpwZw",
      "Rating": 7,
    },
    {
      "Judul": "Judul Berita Dua",
      "Isi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l",
      "Tanggal": "26 September 2025",
      "Gambar":
          "https://imgs.search.brave.com/tHQVojO28XzNR2ZtBRoZOBIrhNXqjzGfjWwT7VwFJgo/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5nZXR0eWltYWdl/cy5jb20vaWQvMTQ0/OTc5MTU4NS92ZWN0/b3IvYnJlYWtpbmct/bmV3cy1iYWNrZ3Jv/dW5kLXZlY3Rvci1z/dG9jay1pbGx1c3Ry/YXRpb24uanBnP3M9/NjEyeDYxMiZ3PTAm/az0yMCZjPU1TT3JB/dThWWGFxdjM4S2FG/OFE0NXphUlJWdmtH/bDlHcEt0Y3hwUFBK/MFE9",
      "Rating": 10,
    },
    {
      "Judul": "Judul Berita Tiga",
      "Isi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l",
      "Tanggal": "27 September 2025",
      "Gambar":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ0aW4NNijQW8xXAK2xPecMIjyPGisA8Re-Ja5YswEG7Y7VxUg-Dng3rVkDKc1-XqREs-w&usqp=CAU",
      "Rating": 8,
    },
    {
      "Judul": "Judul Berita Empat",
      "Isi":
          "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut l",
      "Tanggal": "28 September 2025",
      "Gambar":
          "https://www.shutterstock.com/image-illustration/tv-news-studio-broadcaster-breaking-260nw-1067935568.jpg",
      "Rating": 9,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.greenAccent,
        title: Center(
          child: Text("List View", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: listBerita.length,
          itemBuilder: (context, index) {
            Map<String, dynamic> item = listBerita[index];

            return GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (_)=>DetailBeritaPage(item)));
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 3,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Image(
                        image: NetworkImage(item['Gambar']),
                        width: 200,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item['Judul'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(item['Tanggal']),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              RatingBarIndicator(
                                itemBuilder: (context, index) =>
                                    Icon(Icons.star, color: Colors.greenAccent),
                                rating: item['Rating'],
                                itemCount: 10,
                                itemSize: 15,
                                direction: Axis.horizontal,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
