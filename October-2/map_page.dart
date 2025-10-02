import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Set<Marker> marker ={};

  void _SetMarker() {
    marker.add(
      Marker(
        markerId: MarkerId("Alamat Rumah"),
        position: LatLng(-0.9334206330557511, 100.37716306753882),
        infoWindow: InfoWindow(title: "Jln Parak Jigarang", snippet: "Kota Padang"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(-0.9334206330557511, 100.37716306753882),
          zoom: 12,
        ),
        markers: marker,
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _SetMarker();
  }
}

