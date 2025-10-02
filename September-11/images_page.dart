import 'package:flutter/material.dart';

class ImagesPage extends StatelessWidget {
  const ImagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Center(
          child: Text("Dimas Salon", style: TextStyle(color: Colors.white)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Menampilkan Gambar Minuman",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/1.jpeg',width: 200,),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Text('Cappucino'),
                      Text('Rp. 10.000')
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/2.jpeg',width: 200,),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Text('Dalgona'),
                      Text('Rp. 20.000')
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/3.jpeg',width: 200,),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Text('Milo'),
                      Text('Rp. 30.000')
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/4.jpeg',width: 200,),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Text('Frappucino'),
                      Text('Rp. 40.000')
                    ],
                  )
                ],
              ),
              SizedBox(height: 10,),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset('images/5.jpeg',width: 200,),
                  SizedBox(width: 12,),
                  Column(
                    children: [
                      Text('Matcha'),
                      Text('Rp. 50.000')
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
