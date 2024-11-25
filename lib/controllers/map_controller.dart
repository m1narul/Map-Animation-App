import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapController extends GetxController {
  late GoogleMapController mapController;

  var selectedCategory = 'All'.obs;
  var markers = <Marker>[].obs;
  var userLocationMarker = Rx<Marker?>(null);
  var isDarkMode = false.obs;

  final Map<String, List<Marker>> markerData = {
    'Cycle': [],
    'Shopping': [],
    'Restaurant': [],
  };

  @override
  void onInit() {
    super.onInit();
    _loadCustomIcons();
  }

  Future<void> _loadCustomIcons() async {
    final cycleIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/icons/cycle.png',
    );
    final shoppingIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/icons/shopping.png',
    );
    final restaurantIcon = await BitmapDescriptor.fromAssetImage(
      ImageConfiguration(),
      'assets/icons/restaurant.png',
    );

    markerData['Cycle'] = [
      Marker(
        markerId: MarkerId('cycle_1'),
        position: LatLng(37.7749, -122.4194),
        icon: cycleIcon,
      ),
    ];

    markerData['Shopping'] = [
      Marker(
        markerId: MarkerId('shopping_1'),
        position: LatLng(37.7849, -122.4294),
        icon: shoppingIcon,
      ),
    ];

    markerData['Restaurant'] = [
      Marker(
        markerId: MarkerId('restaurant_1'),
        position: LatLng(37.7649, -122.4094),
        icon: restaurantIcon,
      ),
    ];

    updateMarkers('All'); // Load all markers initially
  }

  void updateMarkers(String category) {
    selectedCategory.value = category;
    markers.value = category == 'All'
        ? markerData.values.expand((markerList) => markerList).toList()
        : markerData[category]!;
  }

  void setMapController(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> fetchUserLocation() async {
    final location = Location();
    final hasPermission = await location.requestPermission() == PermissionStatus.granted;

    if (hasPermission) {
      final locationData = await location.getLocation();
      userLocationMarker.value = Marker(
        markerId: MarkerId('user_location'),
        position: LatLng(locationData.latitude!, locationData.longitude!),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueAzure),
      );
      markers.add(userLocationMarker.value!);
    }
  }

  void toggleMapTheme() async {
    isDarkMode.value = !isDarkMode.value;

    final style = await rootBundle.loadString(
      isDarkMode.value
          ? 'assets/map_styles/dark_mode.json'
          : 'assets/map_styles/light_mode.json',
    );

    mapController.setMapStyle(style);
  }
}
