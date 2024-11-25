import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../controllers/map_controller.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mapController = Get.find<MapController>();

    return Scaffold(
      appBar: AppBar(title: Text('Explore Map')),
      body: Stack(
        children: [
          Obx(() => GoogleMap(
            initialCameraPosition: CameraPosition(
              target: LatLng(37.7749, -122.4194),
              zoom: 10.0,
            ),
            markers: Set<Marker>.of(mapController.markers),
            onMapCreated: mapController.setMapController,
          )),
          Positioned(
            bottom: 20,
            left: 20,
            child: Obx(() => Text(
              'Selected Category: ${mapController.selectedCategory}',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            )),
          ),
        ],
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => mapController.updateMarkers('Cycle'),
            child: Icon(Icons.directions_bike),
            heroTag: 'Cycle',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => mapController.updateMarkers('Shopping'),
            child: Icon(Icons.shopping_cart),
            heroTag: 'Shopping',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => mapController.updateMarkers('Restaurant'),
            child: Icon(Icons.restaurant),
            heroTag: 'Restaurant',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => mapController.fetchUserLocation(),
            child: Icon(Icons.my_location),
            heroTag: 'UserLocation',
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => mapController.toggleMapTheme(),
            child: Obx(() => Icon(
              mapController.isDarkMode.value ? Icons.dark_mode : Icons.light_mode,
            )),
            heroTag: 'DarkMode',
          ),
        ],
      ),
    );
  }
}
