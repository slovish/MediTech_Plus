
import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String? id;
  final String fullname;
  final String email;
  final String password;
  final String phone;
  final String address;
  final String pincode;
  final String? country;
  final String? state;
  final String? city;

  const User(
      {this.id,
      required this.fullname,
      required this.email,
      required this.password,
      required this.phone,
      required this.address,
      required this.pincode,
      required this.country,
      required this.state,
      required this.city});

  tojson() {
    return {
      "fullname": fullname,
      "email" : email,
      "password" : password,
      "phone": phone,
      "address" : address,
      "pincode": pincode,
      "country": country,
      "state": state,
      "city": city
    };
  }

  factory User.fromSnapshot(DocumentSnapshot<Map<String,dynamic>> document){
    final data = document.data()!;
    return User(
      id: document.id,
      fullname: data["fullname"], 
      email: data["email"], 
      password: data["password"], 
      phone: data["phone"], 
      address: data["address"], 
      pincode: data["pincode"], 
      country: data["country"], 
      state: data["state"], 
      city: data["city"]
      );

  }
}
