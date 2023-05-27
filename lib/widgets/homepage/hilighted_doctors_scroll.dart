import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/authentication/controller/doctors_controller.dart';
import 'dr_card.dart';

class hdoctorsec extends StatelessWidget {
  final String city;

  final dr_controller = Get.put(DoctorsController());

  hdoctorsec({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: dr_controller.get_doctors_in_city(city),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            print(snapshot.error);
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    "Doctors in $city",
                    style: const TextStyle(
                        color: Color(0xFF4527A0),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) => const Divider(
                      indent: 20,
                    ),
                    itemBuilder: (context, index) => dr_Card(
                      doctor: snapshot.data![index],
                      index: index,
                    ),
                  ),
                ),
              ],
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else {
            return const Center(child: Text("error"));
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
