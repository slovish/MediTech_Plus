import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import '../../authentication/controller/signup_controller.dart';
import '../../pages/chat_page.dart';

class options_sec extends StatelessWidget {
  final controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Options",
            style: TextStyle(
                color: Colors.deepPurple[900],
                fontSize: 25,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 180,
            width: MediaQuery.of(context).size.width * 0.91,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 13),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 13, right: 13),
                      child: Row(children: [
                        SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: InkWell(
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(
                                        Icons.call_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 12, left: 10),
                                      child: Column(children: [
                                        Text(
                                          "Book",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "Appointment",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepPurple[500],
                                ),
                              ),
                            ),
                            onTap: () => {
                              // SignUpController.instance.add_doctors()
                            },
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.031,
                        ),
                        SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: InkWell(
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Icon(
                                        Icons.chat_sharp,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 15, bottom: 12, left: 15),
                                      child: Column(children: [
                                        Text(
                                          "Chat with",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        Text(
                                          "DOCTOR T",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      ]),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepPurple[600],
                                ),
                              ),
                            ),
                            onTap: () => {
                              // Add your onPressed code here!
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Mychat_page()),
                              )
                            },
                          ),
                        )
                      ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(13),
                      child: Row(children: [
                        SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: InkWell(
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.call_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "Appointment",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepPurple[300],
                                ),
                              ),
                            ),
                            onTap: () => {print("yapped")},
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.031,
                        ),
                        SizedBox(
                          height: 70,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: InkWell(
                            child: Material(
                              elevation: 10,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 5),
                                      child: Icon(
                                        Icons.call_outlined,
                                        color: Colors.white,
                                        size: 40,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text(
                                        "Appointment",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.deepPurple[300],
                                ),
                              ),
                            ),
                            onTap: () => {print("yapped")},
                          ),
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
