import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/map_binding.dart';
import 'screens/home_screen.dart';

void main()async {
  runApp(ExploreMap());
}

class ExploreMap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MapBinding(),
      home: HomeScreen(),
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
