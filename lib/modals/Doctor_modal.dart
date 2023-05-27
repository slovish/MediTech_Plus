// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

// "name": "Aarna Varma",
//         "city": "Bangalore",
//         "specialization": "Neurologist",
//         "hospital": "Aurora, Lal and Baria",
//         "age": 69,
//         "rating": 3.5,
//         "email": "aarnavarma@gmail.com",
//         "available_days": [
//             "Friday",
//             "Saturday",
//             "Thursday",
//             "Tuesday",
//             "Wednesday"
//         ]

class Doctor {
  final String? id;
  final String name;
  final String city;
  final String specialization;
  final String hospital;
  final int age;
  final num rating;
  final String email;

  final List<dynamic> available_days;

  Doctor({
    this.id,
    required this.name,
    required this.city,
    required this.specialization,
    required this.hospital,
    required this.age,
    required this.rating,
    required this.email,
    required this.available_days,
  });

  tojson() {
    return {
      'id': id,
      'name': name,
      'city': city,
      'specialization': specialization,
      'hospital': hospital,
      'age': age,
      'rating': rating,
      'email': email,
      'available_days': available_days,
    };
  }

  factory Doctor.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;

    return Doctor(
      id: document.id,
      name: data['name'],
      city: data['city'],
      specialization: data['specialization'],
      hospital: data['hospital'],
      age: data['age'],
      rating: data['rating'],
      email: data['email'],
      available_days: data['available_days'],
    );
  }
}
