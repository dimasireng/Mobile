import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:syncfusion_flutter_gauges/gauges.dart';

class SensorJantungPage extends StatefulWidget {
  const SensorJantungPage({super.key});

  @override
  State<SensorJantungPage> createState() => _SensorJantungPageState();
}

class _SensorJantungPageState extends State<SensorJantungPage> {
  String _data = 'Loading..';
  double _bpm = 0.0;
  late Timer _timer;

  //Mengambil data dari thnigsboard
  Future<void> _fecthDHT() async {
    try {
      final response = await http.get(
        Uri.parse(
          "http://10.20.29.11:8080/api/v1/7/attributes?clientKeys=suhu_3004,bpm_3004",
        ),
      );
      if (response.statusCode == 200) {
        final _dataResponse = jsonDecode(response.body);

        setState(() {
          _bpm = _dataResponse["client"]["bpm_3004"];
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

  Color getBPNWarna(double nilaiBPM){
    if(nilaiBPM<60) return Color(0xFF0000FF);
    else if(nilaiBPM<100) return Color(0xFF00FF00);
    else if(nilaiBPM<120) return Color(0xFFFFA500);

    else return Color(0xFFFF0000);
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
          child: Text('Sensor Detak Jantung', style: TextStyle(color: Colors.white)),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Detak Jantung",
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),
              ),
              SfRadialGauge(
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 150,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 59,
                        color: Color(0xFF0000FF),
                      ),
                      GaugeRange(
                        startValue: 60,
                        endValue: 100,
                        color: Color(0xFF00FF00),
                      ),
                      GaugeRange(
                        startValue: 100,
                        endValue: 120,
                        color: Color(0xFFFFA500),
                      ),
                      GaugeRange(
                        startValue: 121,
                        endValue: 150,
                        color: Color(0xFFFF0000),
                      ),
                    ],
                    pointers: <GaugePointer>[NeedlePointer(value: _bpm,needleColor: getBPNWarna(_bpm),)],
                    annotations: <GaugeAnnotation>[
                      GaugeAnnotation(
                        widget: Container(
                          child: Text(
                            '$_bpm BPM',
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