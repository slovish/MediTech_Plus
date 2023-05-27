import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/authentication/user_rep.dart';
import '../../data_populating/upload.dart';
import '../auth_repo.dart';
import '../../modals/User_modal.dart';

class SignUpController extends GetxController {
  var registered = false;
  static SignUpController get instance => Get.find();

  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phone = TextEditingController();
  final address = TextEditingController();
  final pincode = TextEditingController();

  final userRepo = Get.put(User_rep());
  final dr_repo = Get.put(Doctors_repo());

  void registerUser(String email, String password) {
    var error = AuthenticationRepository.instance
        .createUserWithEmailAndPassword(email, password);
    // if (error != null) {
    //   Get.showSnackbar(GetSnackBar(
    //     message: error,
    //   ));
    // }
    if (error == null) {
      registered = true;
    }
  }

  Future<void> createUser(User user) async {
    await userRepo.createUser(user);
  }

  Future<void> add_doctors() async {
    await dr_repo.add_all_doctors();
  }
}
