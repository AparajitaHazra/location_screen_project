// lib/models/member.dart

class Member {
  final String id;         // Unique identifier for the member
  final String name;       // Member's name
  final String email;      // Member's email
  final String phoneNumber; // Member's phone number
  final DateTime joinedDate; // Date the member joined

  // Constructor
  Member({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.joinedDate,
  });
}
