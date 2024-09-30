import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../models/visited_location.dart';
import '../models/member.dart';z

class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  _LocationScreenState createState() => _LocationScreenState();
}
// lib/screens/location_screen.dart



class _LocationScreenState extends State<LocationScreen> {
  DateTime selectedDate = DateTime.now();
  List<VisitedLocation> visitedLocations = []; // Replace with actual data
  late GoogleMapController mapController;

  @override
  void initState() {
    super.initState();
    _loadVisitedLocations();
  }

  Future<void> _loadVisitedLocations() async {
    // Simulate loading data (replace this with your data source)
    visitedLocations = [
      VisitedLocation('Location A', DateTime.now().subtract(const Duration(hours: 1))),
      VisitedLocation('Location B', DateTime.now().subtract(const Duration(minutes: 30))),
      VisitedLocation('Location C', DateTime.now()), // Current time
    ];

    // Calculate stop times
    calculateStopTimes(visitedLocations);
  }

  Future<void> _refreshVisitedLocations() async {
    // Logic to refresh data
    await _loadVisitedLocations();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        _loadVisitedLocations(); // Load locations for the selected date
      });
    }
  }

  void calculateStopTimes(List<VisitedLocation> locations) {
    for (int i = 1; i < locations.length; i++) {
      final Duration difference = locations[i].visitTime.difference(locations[i - 1].visitTime);
      if (difference.inMinutes > 10) {
        // Logic to mark this location as a stop, e.g., print or update a property
        print('${locations[i].name} is a stop for more than 10 minutes.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () => _selectDate(context),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: _refreshVisitedLocations,
        child: ListView.builder(
          itemCount: visitedLocations.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(visitedLocations[index].name),
              subtitle: Text(DateFormat('yyyy-MM-dd – kk:mm').format(visitedLocations[index].visitTime)),
              onTap: () {
                // Navigate to route details (if applicable)
              },
            );
          },
        ),
      ),
    );
  }
}
