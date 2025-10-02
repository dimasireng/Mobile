import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapTugas extends StatefulWidget {
  const MapTugas({super.key});

  @override
  State<MapTugas> createState() => _MapTugas();
}

class _MapTugas extends State<MapTugas> {
  final Koordinat = LatLng(-0.9453747012078785, 100.36768156722277);

  final List<Map<String, dynamic>> _ListRS = [
    {
      "nama_hotel": "SIMRS RSUP. Dr M. Djamil Padang",
      "koordinat_hotel": LatLng(-0.942985449063853, 100.36909619648907),
      "alamat":
      "Jl. Kutilang, Sawahan Tim., Kec. Padang Tim., Kota Padang, Sumatera Barat 25171",
    },
    {
      "nama_hotel": "RSUP Dr. M. Djamil Padang",
      "koordinat_hotel": LatLng(-0.9430427911345408, 100.36697425258963),
      "alamat":
      "Jl. Perintis Kemerdekaan, Sawahan Tim., Kec. Padang Tim., Kota Padang, Sumatera Barat 25129",
    },
    {
      "nama_hotel": "Rumah Sakit Umum Suliki",
      "Harga": "Rp. 449.928",
      "koordinat_hotel": LatLng(-0.9452217891198659, 100.36454644290288),
      "alamat":
      "Jl. Tan Malaka No.1, Sawahan, Kec. Suliki, Kabupaten Lima Puluh Kota, Sumatera Barat 26256",
    },
    {
      "nama_hotel": "Rumah Sakit Umum Aisyiyah",
      "koordinat_hotel": LatLng(-0.9473625577389072, 100.36355237909416),
      "alamat":
      "Jl. H. Agus Salim No.6, Sawahan, Kec. Padang Tim., Kota Padang, Sumatera Barat 25171",
    },
    {
      "nama_hotel": "Rumah Sakit Ibu dan Anak Restu Ibu",
      "Harga": "Rp. 449.928",
      "koordinat_hotel": LatLng(-0.9493695271180759, 100.36685955291938),
      "alamat":
      "Jl. Terandam No.5, RW.7, Sawahan, Kec. Padang Tim., Kota Padang, Sumatera Barat 25133",
    },
    {
      "nama_hotel": "Rumah Sakit Ibu Dan Anak Siti Hawa",
      "koordinat_hotel": LatLng(-0.9477830657051877, 100.37595906009173),
      "alamat":
      "Jl. Parak Gadang Raya No.35A, Simpang Haru, Kec. Padang Tim., Kota Padang, Sumatera Barat 25171",
    },
  ];

  Set<Marker> _createMarker() {
    Set<Marker> markers = {};
    for (var hotel in _ListRS) {
      markers.add(
        Marker(
          markerId: MarkerId(hotel['nama_hotel']),
          position: hotel['koordinat_hotel'],
          infoWindow: InfoWindow(
            title: hotel['nama_hotel'],
            snippet: hotel['alamat']
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
        initialCameraPosition: CameraPosition(target: Koordinat, zoom: 12),
        markers: _createMarker(),
      ),
    );
  }
}
