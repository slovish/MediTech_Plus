import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../modals/Doctor_modal.dart';

class Dr_repo extends GetxController {
  static Dr_repo get instance => Get.find();

  final _db = FirebaseFirestore.instance;


  Future<Doctor> getDoctorDetails(String email) async {
    final snapshot =
        await _db.collection("doctors").where("email", isEqualTo: email).get();
    final drData = snapshot.docs.map((e) => Doctor.fromSnapshot(e)).single;
    return drData;
  }

  Future<List<Doctor>> getallDoctorsDetails() async {
    final snapshot = await _db.collection("doctors").get();
    final drDatas = snapshot.docs.map((e) => Doctor.fromSnapshot(e)).toList();
    return drDatas;
  }

  Future<List<Doctor>> get_doctors_is_city_Details(String city) async {
    final collection_name = "doctors_" + city;
    final snapshot = await _db
        .collection(collection_name)
        .orderBy("rating", descending: true)
        .limit(5)
        .get();
    final drDatas = snapshot.docs.map((e) => Doctor.fromSnapshot(e)).toList();
    return drDatas;
  }

  Future<List<Doctor>> get_all_doctors_with_spec(String catName) async {
    final collection_name = "doctors";
    final snapshot = await _db
        .collection(collection_name)
        .where("specialization", isEqualTo: catName)
        .get();
    final drDatas = snapshot.docs.map((e) => Doctor.fromSnapshot(e)).toList();
    return drDatas;
  }
}
