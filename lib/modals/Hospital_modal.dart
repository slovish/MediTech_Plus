// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

// "name": "Vaidya and Sons",
//       "city": "Mumbai",
//       "rating": 2.3,
//       "contact_number": "04956624611",
//       "services_available": [
//         "Colonoscopy",
//         "ECG",
//         "ECG",
//         "Mammogram",
//         "Colonoscopy"
//       ]

class Hospital {
  final String? id;
  final String name;
  final String city;
  final num rating;
  final String contact_number;
  final List<dynamic> services_available;

  Hospital(
      {this.id,
      required this.name,
      required this.city,
      required this.rating,
      required this.contact_number,
      required this.services_available});

  tojson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'rating': rating,
      'contact_number': contact_number,
      'services_available': services_available
    };
  }

  factory Hospital.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return Hospital(
        id: document.id,
        name: data['name'],
        city: data['city'],
        rating: data['rating'],
        contact_number: data['contact_number'],
        services_available: data['services_available']);
  }
}
