import 'package:flutter/material.dart';
import 'package:my_app/modals/Doctor_modal.dart';

import '../../modals/Hospital_modal.dart';
import '../../pages/Dr_profile_page.dart';

class Hospital_card extends StatelessWidget {
  final Hospital hospital;
  final int index;

  const Hospital_card({super.key, required this.hospital, required this.index})
      : assert(hospital != null);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: 150,
      decoration: BoxDecoration(
          color: const Color(0xFFCEBDED),
          borderRadius: BorderRadius.circular(20)),
      child: Stack(children: [
        Positioned(
          left: 25,
          top: 5,
          child: SizedBox(
              width: 100,
              height: 100,
              child: Image(
                fit: BoxFit.fill,
                filterQuality: FilterQuality.high,
                image: AssetImage("assets/hospitals/hospital$index.png"),
              )),
        ),
        Container(
            margin: EdgeInsets.only(top: 100),
            clipBehavior: Clip.hardEdge,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color(0xFF512DA8),
                      Color.fromARGB(255, 120, 76, 196),
                    ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)))),
        Positioned(
          top: 115,
          left: 20,
          child: Container(
            width: 110,
            child: Text(
              hospital.name,
              style: TextStyle(
                  color: Color(0xFFD1C4E9),
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 10,
          child: Row(
            children: [
              Icon(Icons.call, size: 20, color: Color(0xFFD1C4E9)),
              Padding(
                padding: const EdgeInsets.only(left: 3.0),
                child: Text(
                  hospital.contact_number,
                  style: TextStyle(
                      color: Color(0xFFD1C4E9),
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: InkWell(
            // onTap: () => Navigator.of(context).push(
            //   MaterialPageRoute(
            //       builder: (context) {}),
            // ),
            child: Container(
                width: 35,
                height: 35,
                child: Icon(
                  Icons.arrow_forward_rounded,
                  size: 30,
                  color: Colors.deepPurple[700],
                ),
                decoration: BoxDecoration(
                    color: Colors.deepPurple[200],
                    borderRadius:
                        BorderRadius.only(topLeft: Radius.circular(20)))),
          ),
        ),
        Positioned(
            top: 0,
            right: 0,
            child: Stack(
              children: [
                Icon(
                  Icons.circle,
                  size: 40,
                  color: Colors.deepPurple[700],
                ),
                Positioned(
                    top: 10,
                    left: 8,
                    child: Text(
                      hospital.rating.toString(),
                      style: TextStyle(
                          color: Colors.deepPurple[100],
                          fontSize: 17,
                          fontWeight: FontWeight.w900),
                    ))
              ],
            )),
      ]),
    );
  }
}
