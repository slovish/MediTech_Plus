import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_app/pages/homepage.dart';
import 'package:my_app/pages/profile_page.dart';
import '../../authentication/auth_repo.dart';
import '../../modals/User_modal.dart';
import '../../authentication/controller/profile_controller.dart';

class MyDrawer extends StatelessWidget {
  final controller = Get.put(profileController());

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 400),
      child: Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50))),
        backgroundColor: const Color(0xFFD1C4E9),
        width: MediaQuery.of(context).size.width * 0.4,
        child: FutureBuilder(
            future: controller.getUserData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  User user = snapshot.data as User;

                  return ListView(children: [
                    DrawerHeader(
                        margin: EdgeInsets.zero,
                        padding: EdgeInsets.zero,
                        child: UserAccountsDrawerHeader(
                          margin: EdgeInsets.zero,
                          accountName: Text(
                            user.fullname,
                            style: TextStyle(
                                color: Colors.deepPurple[100],
                                fontSize: 22,
                                fontWeight: FontWeight.w600),
                          ),
                          accountEmail: Text(
                            user.email,
                            style: TextStyle(
                                color: Colors.deepPurple[100], fontSize: 15),
                          ),
                          currentAccountPicture: InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const User_profile()),
                              );
                            },
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                  "assets/profile_icons/profile" +
                                      user.phone[user.phone.length - 1] +
                                      ".png"),
                            ),
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const User_profile()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFF673AB7), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.person_2_rounded,
                                      color: Color(0xFF673AB7),
                                      size: 30,
                                    ),
                                    const Text(
                                      "Profile",
                                      style: TextStyle(
                                        color: Color(0xFF673AB7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              await Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Homepage()),
                              );
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFF673AB7), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.home,
                                      color: Color(0xFF673AB7),
                                      size: 30,
                                    ),
                                    const Text(
                                      "Home",
                                      style: TextStyle(
                                        color: Color(0xFF673AB7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () async {
                              AuthenticationRepository.instance.logout();
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                border: Border.all(
                                    color: const Color(0xFF673AB7), width: 3),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.arrow_back_ios_new_rounded,
                                      color: Color(0xFF673AB7),
                                      size: 30,
                                    ),
                                    const Text(
                                      "Logout",
                                      style: TextStyle(
                                        color: Color(0xFF673AB7),
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ]);
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text(snapshot.error.toString()),
                  );
                } else {
                  return const Center(child: Text("kuch to gadbad hai baba"));
                }
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
      ),
    );
  }
}
