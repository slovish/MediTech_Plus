import 'package:get/get.dart';
import '../../modals/Hospital_modal.dart';
import '../hosp_repo.dart';

class HospitalController extends GetxController {
  static HospitalController get instance => Get.find();

  final _hospRepo = Get.put(Hosp_repo());

 

  Future<List<Hospital>> get_Hospital_in_city(String city) async {
    return await _hospRepo.get_Hospital_in_city_Details(city);
  }


}
