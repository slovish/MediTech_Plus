import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/widgets/homepage/hosp_card.dart';
import '../../authentication/controller/hospital_controller.dart';
import 'dr_card.dart';

class hospitals_sec extends StatelessWidget {
  final String city;

  final hosp_controller = Get.put(HospitalController());

  hospitals_sec({super.key, required this.city});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: hosp_controller.get_Hospital_in_city(city),
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
                    "Hospitals in $city",
                    style: const TextStyle(
                        color: Color(0xFF4527A0),
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 190,
                  child: ListView.separated(
                    primary: false,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data!.length,
                    separatorBuilder: (context, index) => const Divider(
                      indent: 20,
                    ),
                    itemBuilder: (context, index) => Hospital_card(
                      hospital: snapshot.data![index],
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
