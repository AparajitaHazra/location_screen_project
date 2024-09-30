// lib/screens/route_details_screen.dart
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RouteDetailsScreen extends StatelessWidget {
  final LatLng startLocation;
  final LatLng stopLocation;

  RouteDetailsScreen({required this.startLocation, required this.stopLocation});

  @override
  Widget build(BuildContext context) {
    // Example distances and durations; replace with actual calculations
    double totalDistance = calculateDistance(startLocation, stopLocation);
    Duration totalDuration = calculateDuration(startLocation, stopLocation);

    return Scaffold(
      appBar: AppBar(title: Text('Route Details')),
      body: Column(
        children: [
          ListTile(
            title: Text('Start: ${startLocation.latitude}, ${startLocation.longitude}'),
          ),
          ListTile(
            title: Text('Stop: ${stopLocation.latitude}, ${stopLocation.longitude}'),
          ),
          ListTile(
            title: Text('Total KMs: ${totalDistance.toStringAsFixed(2)} km'),
          ),
          ListTile(
            title: Text('Total Duration: ${totalDuration.inMinutes} minutes'),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: CameraPosition(
                target: LatLng((startLocation.latitude + stopLocation.latitude) / 2,
                               (startLocation.longitude + stopLocation.longitude) / 2),
                zoom: 10,
              ),
              polylines: Set<Polyline>(), // Add your route polyline here
              markers: {
                Marker(markerId: MarkerId('start'), position: startLocation),
                Marker(markerId: MarkerId('stop'), position: stopLocation),
              },
            ),
          ),
        ],
      ),
    );
  }

  double calculateDistance(LatLng start, LatLng stop) {
    // Replace with actual distance calculation
    return 0.0;
  }

  Duration calculateDuration(LatLng start, LatLng stop) {
    // Replace with actual duration calculation
    return Duration(hours: 1);
  }
}
