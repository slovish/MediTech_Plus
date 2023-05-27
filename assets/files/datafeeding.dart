import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

var city = {
  "name": "Los Angeles",
  "state": "CA",
  "country": "USA"
};

add() {
  final db = FirebaseFirestore.instance;
  pri();
  db.collection("users").add(city).onError((error, stackTrace)=>pri());
}

pri() {
  print("object");
}

void main(List<String> args) {
  add();
}