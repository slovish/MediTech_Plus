import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../authentication/controller/profile_controller.dart';
import '../modals/User_modal.dart';
import '../widgets/homepage/drawer.dart';

class User_profile extends StatelessWidget {
  const User_profile({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final controller = Get.put(profileController());
    return Scaffold(
        appBar: AppBar(
          elevation: 10,
          backgroundColor: Colors.deepPurple[200],
          iconTheme: IconThemeData(color: Colors.deepPurple[900], size: 30),
          toolbarHeight: 50,
          title: Text(
            "My Profile",
            style: TextStyle(
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.w600,
                fontSize: 25),
          ),
        ),
        drawer: MyDrawer(),
        backgroundColor: const Color(0xFFD1C4E9),
        body: SafeArea(
          child: FutureBuilder(
              future: controller.getUserData(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    User user = snapshot.data as User;
                    return Stack(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 600),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFFBBAADB), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 30, right: 30),
                                child: Text(
                                  user.fullname,
                                  style: const TextStyle(
                                    color: Color(0xFFD1C4E9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 210),
                          decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                  begin: Alignment.bottomCenter,
                                  end: Alignment.topCenter,
                                  colors: [
                                    Color(0xFF311B92),
                                    Color(0xFF7E57C2)
                                  ]),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                topRight: Radius.circular(100),
                              )),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 300, left: 30, right: 30),
                          child: Column(children: [
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFFB39DDB), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5, left: 20, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.email,
                                      color: Color(0xFFD1C4E9),
                                      size: 30,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        user.email,
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
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFFB39DDB), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5, left: 20, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.phone,
                                      color: Color(0xFFD1C4E9),
                                      size: 30,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        "+91 " + user.phone,
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
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFFB39DDB), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5, left: 20, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    const Icon(
                                      Icons.house,
                                      color: Color(0xFFD1C4E9),
                                      size: 30,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.6,
                                      child: Text(
                                        user.address,
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
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFFB39DDB), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5.0, bottom: 5, left: 20, right: 20),
                                child: Text(
                                  user.city.toString() +
                                      ", " +
                                      user.state.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFFD1C4E9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFFB39DDB), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 5, bottom: 5, left: 20, right: 20),
                                child: Text(
                                  user.country.toString(),
                                  style: const TextStyle(
                                    color: Color(0xFFD1C4E9),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 22,
                                  ),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              style: ButtonStyle(
                                elevation: MaterialStateProperty.all(20),
                                backgroundColor:
                                    MaterialStatePropertyAll(Color(0xFFB39DDB)),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    // Change your radius here
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                              child: SizedBox(
                                height: 50,
                                width: 110,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Icon(
                                      Icons.edit,
                                      color: Colors.deepPurple[900],
                                      size: 30,
                                    ),
                                    Text(
                                      "Edit",
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
                            )
                          ]),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 105),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 165,
                                height: 165,
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        strokeAlign:
                                            BorderSide.strokeAlignOutside,
                                        color: const Color(0xFFD1C4E9),
                                        width: 15),
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage(
                                          "assets/profile_icons/profile" +
                                              user.phone[
                                                  user.phone.length - 1] +
                                              ".png"),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
              }),
        ));
  }
}
