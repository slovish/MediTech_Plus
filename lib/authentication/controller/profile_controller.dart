import 'package:get/get.dart';
import 'package:my_app/authentication/auth_repo.dart';
import 'package:my_app/authentication/user_rep.dart';

class profileController extends GetxController {
  static profileController get instance => Get.find();

  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(User_rep());


  getUserData(){
    final email = _authRepo.firebaseUser.value?.email;

    if(email != null){
      return _userRepo.getUserDetails(email);
    }
    else{
      Get.snackbar("Error", "Login to continue");
    }

  }
}