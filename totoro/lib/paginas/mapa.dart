import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController mapController;

  // Coordenadas de Ixmiquilpan, Hidalgo, México
  final LatLng _initialPosition = LatLng(20.4519, -99.1805);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mapa de Google')),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _initialPosition,
          zoom: 12.0,
        ),
        markers: {
          Marker(
            markerId: MarkerId('initialPosition'),
            position: _initialPosition,
            infoWindow: InfoWindow(title: 'Ubicación Inicial - Ixmiquilpan'),
          ),
        },
      ),
    );
  }
}
