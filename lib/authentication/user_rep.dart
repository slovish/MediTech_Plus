import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../modals/User_modal.dart';
import 'package:flutter/material.dart';

class User_rep extends GetxController {
  static User_rep get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(User user) async {
    await _db
        .collection("users")
        .add(user.tojson())
        .whenComplete(() => Get.snackbar("", "",
            titleText: Row(
              children: [
                Icon(
                  Icons.thumb_up,
                  color: Colors.deepPurple[900],
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Sucess",
                      style: TextStyle(
                          color: Colors.deepPurple[900],
                          fontSize: 20,
                          fontWeight: FontWeight.w600)),
                ),
              ],
            ),
            messageText: Text("You registered Sucessfully"),
            snackPosition: SnackPosition.TOP,
            backgroundColor: Colors.deepPurple.withOpacity(0.1),
            colorText: Colors.deepPurple))
        .catchError((error, StackTrace) {
      Get.snackbar("", error.toString(),
          titleText: Row(
            children: [
              Icon(
                Icons.thumb_down,
                color: Colors.deepPurple[900],
                size: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Text("Error",
                    style: TextStyle(
                        color: Colors.deepPurple[900],
                        fontSize: 20,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.deepPurple.withOpacity(0.1),
          colorText: Colors.deepPurple);
      print(FlutterError.onError.toString());
    });
  }

  Future<User> getUserDetails(String email) async {
    final snapshot =
        await _db.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => User.fromSnapshot(e)).single;
    return userData;
  }
}
