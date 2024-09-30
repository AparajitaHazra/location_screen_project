// lib/screens/attendance_screen.dart
import 'package:flutter/material.dart';
import '../models/member.dart'; // Import your member model
import 'location_screen.dart'; // Import the location screen

class AttendanceScreen extends StatelessWidget {
  // Remove const from constructor
  AttendanceScreen({super.key});

  final List<Member> members = [
    Member(
      id: '1',
      name: 'John Doe',
      email: 'john@example.com',
      phoneNumber: '123-456-7890',
      joinedDate: DateTime(2023, 1, 15),
    ),
    Member(
      id: '2',
      name: 'Jane Smith',
      email: 'jane@example.com',
      phoneNumber: '987-654-3210',
      joinedDate: DateTime(2023, 2, 20),
    ),
    Member(
      id: '3',
      name: 'Alice Johnson',
      email: 'alice@example.com',
      phoneNumber: '555-555-5555',
      joinedDate: DateTime(2023, 3, 10),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Attendance')),
      body: ListView.builder(
        itemCount: members.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(members[index].name),
            subtitle: Text(members[index].email), // Display email as subtitle
            trailing: IconButton(
              icon: const Icon(Icons.map),
              onPressed: () {
                // Navigate to the location screen
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LocationScreen(member: members[index]),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
