import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_gauges/gauges.dart';

class DhtPage extends StatefulWidget {
  const DhtPage({super.key});

  @override
  State<DhtPage> createState() => _DhtPageState();
}

class _DhtPageState extends State<DhtPage> {
  String _data = 'Loading..';
  double _suhu = 0.0;
  double _kelembapan= 0.0;
  late Timer _timer;

  //Mengambil data dari thnigsboard
  Future<void> _fecthDHT() async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://10.20.29.11:8080/api/v1/7/attributes?clientKeys=suhu_3004,kelembapan_3004",
        ),
      );
      if (response.statusCode == 200) {
        final _dataResponse = jsonDecode(response.body);

        setState(() {
          _suhu = _dataResponse["client"]["suhu_3004"];
          _kelembapan = _dataResponse["client"]["kelembapan_3004"];
        });
      } else {
        setState(() {
          _data = 'Error ${response.statusCode}';
        });
      }
    } catch (e) {
      setState(() {
        _data = 'Error $e';
      });
    }
  }

  Color getSuhuWarna(double nilaiSuhu){
    if(nilaiSuhu<18) return Color(0xFF0000FF);
    else if(nilaiSuhu<23) return Color(0xFF00BFFF);
    else if(nilaiSuhu<28) return Color(0xFF00FF00);
    else if(nilaiSuhu<31) return Color(0xFFFFD700);
    else if(nilaiSuhu<36) return Color(0xFFFFA500);

    else return Color(0xFFFF0000);
  }

  Color getKelembapanWarna(double nilaiKelembapan){
    if(nilaiKelembapan<30) return Color(0xFFFF0000);
    else if(nilaiKelembapan<39) return Color(0xFFFFA500);
    else if(nilaiKelembapan<60) return Color(0xFF00FF00);
    else if(nilaiKelembapan<80) return Color(0xFF00BFFF);

    else return Color(0xFF0000FF);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fecthDHT();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer t) {
      _fecthDHT();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Sensor DHT', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Suhu",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 17,
                        color: Color(0xFF0000FF),
                      ),
                      GaugeRange(
                        startValue: 18,
                        endValue: 22,
                        color: Color(0xFF00BFFF),
                      ),
                      GaugeRange(
                        startValue: 23,
                        endValue: 27,
                        color: Color(0xFF00FF00),
                      ),
                      GaugeRange(
                        startValue: 26,
                        endValue: 30,
                        color: Color(0xFFFFD700),
                      ),
                      GaugeRange(
                        startValue: 31,
                        endValue: 35,
                        color: Color(0xFFFFA500),
                      ),
                      GaugeRange(
                        startValue: 36,
                        endValue: 100,
                        color: Color(0xFFFF0000),
                      ),
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: _suhu,needleColor: getSuhuWarna(_suhu),)],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            '$_suhu ℃',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "Kelembapan",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 100,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 29,
                        color: Color(0xFFFF0000),
                      ),
                      GaugeRange(
                        startValue: 30,
                        endValue: 39,
                        color: Color(0xFFFFA500),
                      ),
                      GaugeRange(
                        startValue: 40,
                        endValue: 60,
                        color: Color(0xFF00FF00),
                      ),
                      GaugeRange(
                        startValue: 61,
                        endValue: 80,
                        color: Color(0xFF00BFFF),
                      ),
                      GaugeRange(
                        startValue: 81,
                        endValue: 100,
                        color: Color(0xFF0000FF),
                      ),
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: _kelembapan,needleColor: getKelembapanWarna(_kelembapan),)],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            '$_kelembapan %RH',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        angle: 90,
                        positionFactor: 0.5,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
