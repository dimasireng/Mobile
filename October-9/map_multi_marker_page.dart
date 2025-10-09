import 'package:custom_info_window/custom_info_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapStackMultiMarkerPage extends StatefulWidget {
  const MapStackMultiMarkerPage({super.key});

  @override
  State<MapStackMultiMarkerPage> createState() =>
      _MapStackMultiMarkerPageState();
}

class _MapStackMultiMarkerPageState extends State<MapStackMultiMarkerPage> {
  final Koordinat = LatLng(-0.9451899349437569, 100.35713321703412);
  final CustomInfoWindowController _customInfoWindowController =
      CustomInfoWindowController();

  MapType _mapType = MapType.normal;

  void _pilihMapType() {
    setState(() {
      _mapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

  String? _currentTheme;
  Future<void> _loadTheme(String path) async {
    String theme = await rootBundle.loadString(path);
    setState(() {
      _currentTheme = theme;
    });
  }

  void _standardTheme() => _loadTheme('assets/theme_maps/standard.json');
  void _silverTheme() => _loadTheme('assets/theme_maps/silver.json');
  void _retroTheme() => _loadTheme('assets/theme_maps/retro.json');
  void _darkTheme() => _loadTheme('assets/theme_maps/dark.json');
  final List<Map<String, dynamic>> _ListHotel = [
    {
      "id": "id-001",
      "nama_hotel": "favehotel Olo Padang",
      "harga": "Rp. 374.648",
      "gambar": "assets/images/hotel11.jpg",
      "koordinat_hotel": LatLng(-0.9452647223050296, 100.35593608276845),
      "alamat":
          "Jl. Blk. Olo No.46, Olo, Kec. Padang Bar., Kota Padang, Sumatera Barat 25116",
      "rating": 9,
    },
    {
      "id": "id-002",
      "nama_hotel": "Hotel Bhakti",
      "harga": "Rp. 229.971",
      "gambar": "assets/images/hotel12.jpg",
      "koordinat_hotel": LatLng(-0.944270793581121, 100.35706396285914),
      "alamat":
          "Jl. Belakang Olo 1 No.16, Kp. Jao, Kec. Padang Bar., Kota Padang, Sumatera Barat 25112",
      "rating": 9,
    },
    {
      "id": "id-003",
      "nama_hotel": "Rocky Plaza Hotel Padang",
      "harga": "Rp. 449.928",
      "gambar": "assets/images/hotel13.png",
      "koordinat_hotel": LatLng(-0.9467173868512351, 100.35933883965224),
      "alamat":
          "Jl. Permindo No.40, Kp. Jao, Kec. Padang Bar., Kota Padang, Sumatera Barat 25111",
      "rating": 9,
    },
    {
      "id": "id-004",
      "nama_hotel": "RedDoorz Syariah near Pasar Raya Padang",
      "harga": "Rp. 170.148",
      "gambar": "assets/images/hotel14.jpg",
      "koordinat_hotel": LatLng(-0.947080552892726, 100.35777127749229),
      "alamat":
          "3924+JXV, Jl. Kp. Jawa Dalam II, Kp. Jao, Kec. Padang Bar., Kota Padang, Sumatera Barat",
      "rating": 9,
    },
  ];

  Set<Marker> _createMarker() {
    Set<Marker> markers = {};
    for (var hotel in _ListHotel) {
      markers.add(
        Marker(
          markerId: MarkerId(hotel['nama_hotel']),
          position: hotel['koordinat_hotel'],
          onTap: () {
            _customInfoWindowController.addInfoWindow!(
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)]
                ),
                child: Column(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        child: Image.asset(
                          (hotel['gambar']),
                          width: 200,
                          // height: 100,
                          // fit: BoxFit.cover,
                        )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(hotel['nama_hotel'], style: TextStyle(fontSize: 8),),
                          Text(hotel['harga'], style: TextStyle(fontSize: 8),),
                          RatingBarIndicator(
                            itemBuilder: (context, index) =>
                                Icon(Icons.star, color: Colors.greenAccent),
                            rating: hotel['Rating'],
                            itemCount: 10,
                            itemSize: 15,
                            direction: Axis.horizontal,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              hotel['koordinat_hotel'],
            );
          },
          // infoWindow: InfoWindow(
          //   title: hotel['alamat'],
          //   snippet: hotel['Harga'],
          // ),
        ),
      );
    }
    return markers;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: Koordinat, zoom: 13),
            markers: _createMarker(),
            mapType: _mapType,
            style: _currentTheme,
            onMapCreated: (controller) {
              _customInfoWindowController.googleMapController = controller;
            },
            onTap: (position) => _customInfoWindowController.hideInfoWindow!(),
          ),
          Positioned(
            bottom: 16,
            left: 16,
            child: Column(
              children: [
                FloatingActionButton(
                  onPressed: _pilihMapType,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: _mapType == MapType.normal
                      ? Icon(Icons.map, size: 36, color: Colors.white)
                      : Icon(Icons.satellite, size: 36, color: Colors.white),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _standardTheme,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.sunny, size: 36, color: Colors.white),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _silverTheme,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.location_city,
                    size: 36,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _retroTheme,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.cabin, size: 36, color: Colors.white),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  onPressed: _darkTheme,
                  backgroundColor: Colors.green,
                  child: Icon(Icons.shield_moon, size: 36, color: Colors.white),
                ),

              ],
            ),
          ),
          CustomInfoWindow(
            controller: _customInfoWindowController,
            height: 150,
            width: 200,
            offset: 50,
          ),
        ],
      ),
    );
  }
}
