import 'dart:ui';

import 'package:flutter/material.dart';

import '../modals/Doctor_modal.dart';

class dr_Details_page extends StatelessWidget {
  final Doctor doctor;
  final int index;
  const dr_Details_page({super.key, required this.doctor, required this.index});

  Widget _field(context, IconData icon, String fieldvalue) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFB39DDB), width: 3),
      ),
      child: Padding(
        padding:
            const EdgeInsets.only(top: 5.0, bottom: 5, left: 20, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              icon,
              color: Color(0xFFD1C4E9),
              size: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              child: Text(
                fieldvalue,
                style: const TextStyle(
                  color: Color(0xFFD1C4E9),
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _days_vs_availablity(day) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Color(0xFFD1C4E9)),
          borderRadius: BorderRadius.circular(10)),
      height: 70,
      width: 40,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            doctor.available_days.contains(day) ? Icons.check : Icons.close,
            size: 25,
            color: Colors.deepPurple[100],
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            child: Expanded(
                child: Divider(
              thickness: 2,
              color: Color(0xFFD1C4E9),
            )),
          ),
          Text(
            day.substring(0, 3),
            style: const TextStyle(
              color: Color(0xFFD1C4E9),
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }

  Widget _availeble_days_sec() {
    return Container(
      margin: const EdgeInsets.only(top: 20, bottom: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(color: const Color(0xFFB39DDB), width: 3),
      ),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 10, bottom: 5, left: 30, right: 20),
            child: Row(
              children: [
                const Icon(
                  Icons.calendar_month,
                  color: Color(0xFFD1C4E9),
                  size: 30,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Text(
                    "Available days",
                    style: const TextStyle(
                      color: Color(0xFFD1C4E9),
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 5, bottom: 20, left: 10, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _days_vs_availablity("Monday"),
                _days_vs_availablity("Tuesday"),
                _days_vs_availablity("Wednesday"),
                _days_vs_availablity("Thursday"),
                _days_vs_availablity("Friday"),
                _days_vs_availablity("Saturday"),
                _days_vs_availablity("Sunday"),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(20),
          backgroundColor: MaterialStatePropertyAll(Color(0xFFB39DDB)),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              // Change your radius here
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        child: SizedBox(
          height: 60,
          width: 150,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Book",
                style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Text(
                "Appointmet",
                style: TextStyle(
                  color: Colors.deepPurple[900],
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ],
          ),
        ),
        onPressed: () => {},
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double headerSec = totalHeight / 3.2;
    double heightImgSec = totalHeight / 5.5;
    double totalwidth = MediaQuery.of(context).size.width;

    return SafeArea(
      bottom: true,
      top: false,
      child: Scaffold(
          appBar: AppBar(
            iconTheme: IconThemeData(color: Colors.deepPurple[900], size: 30),
            title: Text(
              "Doctors Profile",
              style: TextStyle(
                  color: Colors.deepPurple[900], fontWeight: FontWeight.w600),
              textScaleFactor: 1.1,
            ),
            toolbarHeight: totalHeight * 0.06,
            backgroundColor: Colors.deepPurple[200],
            elevation: 10,
          ),
          backgroundColor: Colors.deepPurple[100],
          body: Stack(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: totalHeight - headerSec),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Color(0xFF7E57C2),
                          Color(0xFFB39DDB),
                        ]),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(100),
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: headerSec * 0.05, left: headerSec * 0.9),
                  child: Stack(
                    children: [
                      Icon(
                        Icons.star_rounded,
                        size: 120,
                        color: Colors.deepPurple[100],
                      ),
                      Positioned(
                          top: 45,
                          left: 37,
                          child: Text(
                            doctor.rating.toString(),
                            style: TextStyle(
                                color: Colors.deepPurple[600],
                                fontSize: 30,
                                fontWeight: FontWeight.w900),
                          ))
                    ],
                  )),
              Container(
                margin: EdgeInsets.only(
                    top: headerSec * 0.1, left: totalwidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Dr.",
                      style: const TextStyle(
                        color: Color(0xFFDED7ED),
                        fontWeight: FontWeight.bold,
                        fontSize: 35,
                      ),
                    ),
                    Text(
                      doctor.name,
                      style: const TextStyle(
                        color: Color(0xFFDED7ED),
                        fontWeight: FontWeight.w500,
                        fontSize: 30,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: totalHeight * 0.17, left: totalwidth * 0.47),
                child: Text(
                  doctor.specialization,
                  style: const TextStyle(
                      color: Color(0xFFD1C4E9),
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                      fontStyle: FontStyle.italic),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: headerSec - 50),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [Color(0xFF311B92), Color(0xFF7E57C2)]),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(80),
                    )),
              ),
              Container(
                  margin: EdgeInsets.only(
                      top: headerSec * 0.87,
                      left: totalwidth * 0.45,
                      right: totalwidth * 0.12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border:
                        Border.all(color: const Color(0xFFB39DDB), width: 3),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Row(children: [
                      Icon(
                        Icons.location_on,
                        size: 30,
                        color: Colors.deepPurple[100],
                      ),
                      Text(
                        doctor.city,
                        style: const TextStyle(
                          color: Color(0xFFD1C4E9),
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ]),
                  )),
              Container(
                margin: const EdgeInsets.only(top: 300, left: 30, right: 30),
                child: Column(children: [
                  _field(context, Icons.email, doctor.email),
                  _field(context, Icons.apartment_rounded, doctor.hospital),
                  _availeble_days_sec(),
                  _submitButton()
                ]),
              ),
              Container(
                margin: EdgeInsets.only(
                    top: headerSec - heightImgSec + 10, left: 10),
                child: SizedBox(
                  width: heightImgSec,
                  height: heightImgSec,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 130, 94, 193),
                      borderRadius: BorderRadius.circular(heightImgSec * 0.4),
                      border: Border.all(
                          color: Color(0xFFD1C4E9),
                          width: 10,
                          strokeAlign: BorderSide.strokeAlignOutside),
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage("assets/images/doctor$index.png")),
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
