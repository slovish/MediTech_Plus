import 'package:get/get.dart';
import 'package:my_app/authentication/dr_repo.dart';

import '../../modals/Doctor_modal.dart';

class DoctorsController extends GetxController {
  static DoctorsController get instance => Get.find();

  final _drRepo = Get.put(Dr_repo());

  Future<List<Doctor>> getalldoctordata() async {
    return await _drRepo.getallDoctorsDetails();
  }

  Future<List<Doctor>> get_doctors_in_city(String city) async {
    return await _drRepo.get_doctors_is_city_Details(city);
  }

  Future<List<Doctor>> get_doctors_with_spec(String catName) async {
    return await _drRepo.get_all_doctors_with_spec(catName);
  }
}
