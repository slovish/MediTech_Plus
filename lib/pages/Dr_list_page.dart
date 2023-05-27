import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:my_app/modals/Doctor_modal.dart';
import 'package:my_app/modals/diceases_cat.dart';

import '../authentication/controller/doctors_controller.dart';
import '../widgets/homepage/dr_card.dart';
import 'Dr_profile_page.dart';

class dr_list_page extends StatelessWidget {
  final Category category;
  dr_list_page({super.key, required this.category});
  final dr_controller = Get.put(DoctorsController());

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double header_sec = totalHeight / 3.2;
    double height_img_sec = totalHeight / 6.3;
    double totalwidth = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: Colors.deepPurple[100],
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.deepPurple[900], size: 30),
          title: Text(
            category.name + "s",
            style: TextStyle(
                color: Colors.deepPurple[900], fontWeight: FontWeight.w600),
            textScaleFactor: 1.1,
          ),
          toolbarHeight: totalHeight * 0.06,
          backgroundColor: Colors.deepPurple[200],
          elevation: 10,
        ),
        body: SafeArea(
            child: FutureBuilder(
          future: dr_controller.get_doctors_with_spec(category.name),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                print(snapshot.error);
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                          bottom: totalHeight - header_sec,
                          right: totalwidth * 0.1),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [
                                Color(0xFFBEB0D7),
                                Color(0xFF5E35B1),
                              ]),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(80),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: header_sec - 50, left: totalwidth * 0.1),
                      decoration: const BoxDecoration(
                          gradient: LinearGradient(
                              begin: Alignment.centerLeft,
                              end: Alignment.centerRight,
                              colors: [Color(0xFF5E35B1), Color(0xFFBEB0D7)]),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(80),
                          )),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20, left: 15),
                      decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(height_img_sec * 0.3),
                          border: Border.all(
                              width: 5,
                              color: Color.fromARGB(255, 129, 93, 190))),
                      child: Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(height_img_sec * 0.28),
                        ),
                        height: height_img_sec,
                        width: height_img_sec,
                        child: Image(
                          image: AssetImage(category.image),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                        margin: EdgeInsets.only(
                          top: 24,
                          left: totalwidth * 0.44,
                          right: totalwidth * 0.14,
                        ),
                        height: height_img_sec + 7,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(80)),
                            border:
                                Border.all(width: 3, color: Color(0xFFBEB0D7))),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            category.info,
                            style: TextStyle(color: Color(0xFFCAC1D9)),
                          ),
                        )),
                    Container(
                      margin: EdgeInsets.only(
                        top: header_sec * 0.88,
                        left: totalwidth * 0.25,
                      ),
                      child: Text(
                        "Some " + category.name + "s",
                        style: TextStyle(
                            color: Color.fromARGB(255, 209, 207, 221),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: header_sec, left: 40),
                      child: ListView.separated(
                        primary: false,
                        shrinkWrap: true,
                        // scrollDirection: Axis.horizontal,
                        itemCount: snapshot.data!.length,
                        separatorBuilder: (context, index) => Divider(),
                        itemBuilder: (context, index) => Mydr_small_card(
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
        )));
  }
}
