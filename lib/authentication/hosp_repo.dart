import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../modals/Hospital_modal.dart';

class Hosp_repo extends GetxController {
  static Hosp_repo get instance => Get.find();

  final _db = FirebaseFirestore.instance;



  Future<List<Hospital>> get_Hospital_in_city_Details(String city) async {
    final collectionName = "hospital_$city";
    final snapshot = await _db
        .collection(collectionName)
        .orderBy("rating", descending: true)
        .limit(10)
        .get();
    final drDatas = snapshot.docs.map((e) => Hospital.fromSnapshot(e)).toList();
    return drDatas;
  }


}
