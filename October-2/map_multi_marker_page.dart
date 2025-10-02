import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapMultiMarkerPage extends StatefulWidget {
  const MapMultiMarkerPage({super.key});

  @override
  State<MapMultiMarkerPage> createState() => _MapMultiMarkerPageState();
}

class _MapMultiMarkerPageState extends State<MapMultiMarkerPage> {
  final Koordinat = LatLng(-0.9451899349437569, 100.35713321703412);

  final List<Map<String, dynamic>> _ListHotel = [
    {
      "nama_hotel": "favehotel Olo Padang",
      "Harga": "Rp. 374.648",
      "koordinat_hotel": LatLng(-0.9452647223050296, 100.35593608276845),
      "alamat":
          "Jl. Blk. Olo No.46, Olo, Kec. Padang Bar., Kota Padang, Sumatera Barat 25116",
    },
    {
      "nama_hotel": "Hotel Bhakti",
      "Harga": "Rp. 229.971",
      "koordinat_hotel": LatLng(-0.944270793581121, 100.35706396285914),
      "alamat":
          "Jl. Belakang Olo 1 No.16, Kp. Jao, Kec. Padang Bar., Kota Padang, Sumatera Barat 25112",
    },
    {
      "nama_hotel": "Rocky Plaza Hotel Padang",
      "Harga": "Rp. 449.928",
      "koordinat_hotel": LatLng(-0.9467173868512351, 100.35933883965224),
      "alamat":
          "Jl. Permindo No.40, Kp. Jao, Kec. Padang Bar., Kota Padang, Sumatera Barat 25111",
    },
    {
      "nama_hotel": "RedDoorz Syariah near Pasar Raya Padang",
      "Harga": "Rp. 170.148",
      "koordinat_hotel": LatLng(-0.947080552892726, 100.35777127749229),
      "alamat":
          "3924+JXV, Jl. Kp. Jawa Dalam II, Kp. Jao, Kec. Padang Bar., Kota Padang, Sumatera Barat",
    },
  ];

  Set<Marker> _createMarker() {
    Set<Marker> markers = {};
    for (var hotel in _ListHotel) {
      markers.add(
        Marker(
          markerId: MarkerId(hotel['nama_hotel']),
          position: hotel['koordinat_hotel'],
          infoWindow: InfoWindow(
            title: hotel['alamat'],
            snippet: hotel['Harga'],
          ),
        ),
      );
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: CameraPosition(target: Koordinat, zoom: 13),
        markers: _createMarker(),
      ),
    );
  }
}
