import 'package:flutter/material.dart';
import 'package:my_app/modals/Doctor_modal.dart';

import '../../pages/Dr_profile_page.dart';

class dr_Card extends StatelessWidget {
  final Doctor doctor;
  final int index;

  const dr_Card({super.key, required this.doctor, required this.index})
      : assert(doctor != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 300,
      height: 100,
      decoration: BoxDecoration(
          color: Colors.deepPurple[300],
          borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        Container(
          width: 150,
          child: Material(
              shadowColor: Colors.black,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
              elevation: 20,
              color: Colors.deepPurple[500],
              child: Stack(
                children: [
                  const Positioned(
                    top: 30,
                    left: 20,
                    child: Text(
                      "DR.",
                      style: TextStyle(color: Color(0xFFD1C4E9), fontSize: 20),
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 20,
                    child: Text(
                      doctor.name.split(" ")[0],
                      style: TextStyle(
                          color: Color(0xFFD1C4E9),
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Positioned(
                    top: 80,
                    left: 20,
                    child: Text(
                      doctor.name.split(" ")[1],
                      style: TextStyle(
                          color: Colors.deepPurple[100],
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Positioned(
                    top: 110,
                    left: 20,
                    child: Text(
                      doctor.specialization,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    child: InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => dr_Details_page(
                                  doctor: doctor,
                                  index: index,
                                )),
                      ),
                      child: Hero(
                        tag: doctor,
                        child: Container(
                            width: 60,
                            height: 40,
                            child: Icon(
                              Icons.arrow_forward,
                              size: 30,
                              color: Colors.deepPurple[500],
                            ),
                            decoration: BoxDecoration(
                                color: Colors.deepPurple[300],
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20)))),
                      ),
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      left: 70,
                      child: Stack(
                        children: [
                          Icon(
                            Icons.thumb_up_alt_rounded,
                            size: 60,
                            color: Color.fromARGB(255, 220, 212, 235),
                          ),
                          Positioned(
                              top: 25,
                              left: 22,
                              child: Text(
                                doctor.rating.toString(),
                                style: TextStyle(
                                    color: Colors.deepPurple[900],
                                    fontSize: 17,
                                    fontWeight: FontWeight.w900),
                              ))
                        ],
                      )),
                ],
              )),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
              width: 150,
              height: 190,
              child: Image(
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
                image: AssetImage("assets/doctors_images/doctor$index.png"),
              )),
        )
      ]),
    );
  }
}

class Mydr_small_card extends StatelessWidget {
  final Doctor doctor;
  final int index;

  const Mydr_small_card({super.key, required this.doctor, required this.index})
      : assert(doctor != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15),
      height: 80,
      child: Stack(children: [
        Positioned(
          child: Container(
            margin: EdgeInsets.only(top: 20, left: 30),
            height: 60,
            decoration: BoxDecoration(
                border: Border.all(width: 4, color: Color(0xFF4527A0)),
                color: Colors.deepPurple[300],
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Positioned(
          top: 25,
          left: 65,
          child: Text(
            "Dr. " + doctor.name,
            style: TextStyle(
                color: Color(0xFFD1C4E9),
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
        Positioned(
          bottom: 10,
          left: 65,
          child: Text(
            doctor.city,
            style: TextStyle(
                color: Color(0xFFD1C4E9),
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
        Positioned(
          top: 20,
          right: 0,
          child: InkWell(
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => dr_Details_page(
                        doctor: doctor,
                        index: index,
                      )),
            ),
            child: Hero(
              tag: doctor,
              child: Container(
                  width: 45,
                  height: 60,
                  child: Icon(
                    Icons.arrow_forward_ios,
                    size: 30,
                    color: Colors.deepPurple[100],
                  ),
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[800],
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          bottomLeft: Radius.circular(30)))),
            ),
          ),
        ),
        Positioned(
            top: -10,
            left: 0,
            child: Stack(
              children: [
                Icon(
                  Icons.star_rounded,
                  size: 70,
                  color: Colors.deepPurple[100],
                ),
                Positioned(
                    top: 25,
                    left: 22,
                    child: Text(
                      doctor.rating.toString(),
                      style: TextStyle(
                          color: Colors.deepPurple[900],
                          fontSize: 17,
                          fontWeight: FontWeight.w900),
                    ))
              ],
            )),
      ]),
    );
  }
}
