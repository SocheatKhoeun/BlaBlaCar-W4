import 'package:flutter/material.dart';
import '/repository/mock/mock_ride_preferences_repository.dart';
import '/repository/mock/mock_locations_repository.dart';
import 'screens/ride_pref/ride_pref_screen.dart';
import 'service/ride_prefs_service.dart';
import 'service/locations_service.dart';
import 'theme/theme.dart';

void main() {
  // 1 - Initialize the services
  RidePrefService.initialize(MockRidePreferencesRepository());
  LocationsService locationsService = LocationsService(MockLocationsRepository());

  // 2- Run the UI
  runApp(MyApp(locationsService: locationsService));
}

class MyApp extends StatelessWidget {
  final LocationsService locationsService;

  const MyApp({super.key, required this.locationsService});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme,
      home: Scaffold(body: RidePrefScreen(locationsService: locationsService)),
    );
  }
}