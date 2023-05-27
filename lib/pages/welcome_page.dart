import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/login.dart';
import 'package:my_app/pages/registration_page.dart';

class welcome_page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const textStyle = TextStyle(
      color: Color(0xFFD1C4E9),
      fontWeight: FontWeight.bold,
      fontSize: 35,
    );
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 300),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xFF7E57C2),
                        Color(0xFFB39DDB),
                      ]),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                    bottomRight: Radius.circular(100),
                  )),
            ),

            // "Welcome to our symptom checker app - your personalized health companion. Quickly assess your symptoms and get personalized recommendations. Take control of your health today. Your health, your way.",

            Container(
              margin: EdgeInsets.only(top: 20, left: 10, right: 10),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20),
                      backgroundColor: const MaterialStatePropertyAll(
                          Color.fromARGB(255, 52, 34, 135)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.health_and_safety_rounded,
                              color: Color(0xFFD1C4E9),
                              size: 60,
                            ),
                          ),
                          const Text(
                            "MediTrack Plus",
                            style: textStyle,
                          ),
                        ],
                      ),
                    ),
                    onPressed: () => {},
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 30, bottom: 10, left: 20, right: 20),
                    child: Text(
                      "Our symptom checker app provides quick symptom assessment and personalized recommendations. It's user-friendly, intuitive, and tailored to meet your individual needs.",
                      style: TextStyle(
                        color: Color(0xFFD1C4E9),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      "Our mission is to empower you to take control of your health by providing reliable health information at your fingertips.",
                      style: TextStyle(
                        color: Color(0xFFD1C4E9),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
                    child: Text(
                      "Thank you for choosing our app as your trusted health companion.",
                      style: TextStyle(
                        color: Color(0xFFD1C4E9),
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 550),
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Color(0xFF311B92), Color(0xFF7E57C2)]),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100),
                  )),
            ),
            Container(
              margin: const EdgeInsets.only(top: 600, left: 50, right: 50),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFB39DDB)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "SignIn",
                            style: TextStyle(
                              color: Colors.deepPurple[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Login_page()),
                      )
                    },
                  ),
                  Container(
                      margin: const EdgeInsets.symmetric(vertical: 15),
                      child: Row(
                        children: [
                          Container(
                            child: Expanded(
                                child: Container(
                              margin: const EdgeInsets.only(
                                left: 30,
                                right: 10,
                              ),
                              child: Divider(
                                thickness: 2,
                                color: Colors.deepPurple[200],
                              ),
                            )),
                          ),
                          Text(
                            "OR",
                            style: TextStyle(
                                color: Colors.deepPurple[200],
                                fontSize: 20,
                                fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                              child: Container(
                            margin: const EdgeInsets.only(
                              left: 10,
                              right: 30,
                            ),
                            child: Divider(
                              thickness: 2,
                              color: Colors.deepPurple[200],
                            ),
                          )),
                        ],
                      )),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(20),
                      backgroundColor:
                          const MaterialStatePropertyAll(Color(0xFFB39DDB)),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          // Change your radius here
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Text(
                            "SignUp",
                            style: TextStyle(
                              color: Colors.deepPurple[900],
                              fontWeight: FontWeight.bold,
                              fontSize: 35,
                            ),
                          ),
                        ),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const registration_page()),
                      )
                    },
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 105),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.center,
            //     children: [
            //       SizedBox(
            //         width: 180,
            //         height: 180,
            //         child: Container(
            //           decoration: BoxDecoration(
            //             border:
            //                 Border.all(color: const Color(0xFFD1C4E9), width: 15),
            //             shape: BoxShape.circle,
            //             image: const DecorationImage(
            //                 fit: BoxFit.cover,
            //                 image: NetworkImage(
            //                     "https://w0.peakpx.com/wallpaper/480/995/HD-wallpaper-lord-krishna-bhagwan-krishna-lord-shree-thumbnail.jpg")),
            //           ),
            //         ),
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
