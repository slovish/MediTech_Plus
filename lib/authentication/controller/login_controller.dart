import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../auth_repo.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  Future<void> loginUser(String email, String password) async {
    String? error = await AuthenticationRepository.instance
        .loginWithEmailAndPassword(email, password);
    print(error);
    if (error != null) {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        borderRadius: 30,
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
        messageText: Text(
          error.toString(),
          style: TextStyle(color: Colors.deepPurple[900], fontSize: 20),
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.deepPurple.withOpacity(0.2),
      ));
    } else {
      Get.showSnackbar(GetSnackBar(
        duration: Duration(seconds: 2),
        borderRadius: 30,
        titleText: Row(
          children: [
            Icon(
              Icons.thumb_up,
              color: Colors.deepPurple[900],
              size: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text("Success",
                  style: TextStyle(
                      color: Colors.deepPurple[900],
                      fontSize: 20,
                      fontWeight: FontWeight.w600)),
            ),
          ],
        ),
        messageText: Text(
          "Login sucessfull",
          style: TextStyle(color: Colors.deepPurple[900], fontSize: 20),
        ),
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.deepPurple.withOpacity(0.2),
      ));
    }
  }
}
