import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_app/authentication/controller/profile_controller.dart';
import 'dart:convert';
import 'package:my_app/modals/diceases_cat.dart';
import 'package:url_launcher/url_launcher.dart';
import '../utils/location.dart';
import '../widgets/homepage/drawer.dart';
import '../widgets/homepage/hilighted_doctors_scroll.dart';
import '../widgets/homepage/highlited_diceases_scroll.dart';
import '../widgets/homepage/hospital_sec.dart';
import '../modals/User_modal.dart';
import 'chat_page.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    load_hcat_Data();
  }

  load_hcat_Data() async {
    var cat_json = await rootBundle.loadString("assets/files/categories.json");
    var decodeddata2 = jsonDecode(cat_json);
    print(decodeddata2);
    diceases_catagory.categories = List.from(decodeddata2)
        .map<Category>((p) => Category.fromjson(p))
        .toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    double totalHeight = MediaQuery.of(context).size.height;
    double totalwidth = MediaQuery.of(context).size.width;

    final controller = Get.put(profileController());
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Stack(
        children: [
          Container(
            child: SingleChildScrollView(
              physics: ClampingScrollPhysics(),
              child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        User user = snapshot.data as User;
                        return Stack(children: [
                          Container(
                              height: totalHeight * 1.2,
                              decoration: const BoxDecoration(
                                gradient: LinearGradient(
                                    begin: Alignment.bottomCenter,
                                    end: Alignment.topCenter,
                                    colors: [
                                      Color.fromARGB(255, 118, 107, 164),
                                      Color.fromARGB(255, 180, 162, 213),
                                    ]),
                              )),
                          Container(
                              margin: EdgeInsets.only(left: totalwidth * 0.05),
                              child: Column(
                                children: [
                                  hdoctorsec(
                                    city: user.city.toString(),
                                  ),
                                  const categeory_sec(),
                                  // options_sec(),
                                  hospitals_sec(
                                    city: user.city.toString(),
                                  ),
                                ],
                              )),
                        ]);
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(snapshot.error.toString()),
                        );
                      } else {
                        return const Center(child: Text("somting error"));
                      }
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: totalHeight * 0.78),
            clipBehavior: Clip.hardEdge,
            height: totalHeight * 0.15,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Color.fromARGB(255, 51, 29, 148),
                      Color.fromARGB(255, 131, 94, 196),
                    ]),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(80),
                    topRight: Radius.circular(80))),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: () {
                      // ignore: deprecated_member_use
                      launch('tel:911');
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[200],
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: SizedBox(
                                height: 40,
                                width: 40,
                                child: Image.asset(
                                    "assets/icons/ambulance.png")))),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Mychat_page()),
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[200],
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Icon(
                            Icons.chat,
                            color: Colors.deepPurple[800],
                            size: 40.0,
                          ),
                        )),
                  ),
                  InkWell(
                    onTap: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LocationPage()),
                      );
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.deepPurple[200],
                            borderRadius: BorderRadius.circular(30)),
                        child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                                height: 44,
                                width: 44,
                                child: Image.asset(
                                    "assets/icons/emergency.png")))),
                  )
                ]),
          ),
        ],
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFB39DDB),
        iconTheme: IconThemeData(color: Colors.deepPurple[900], size: 30),
        toolbarHeight: totalHeight * 0.06,
        elevation: 10,
        title: Text(
          "MediTech Plus",
          style: TextStyle(
              color: Colors.deepPurple[900],
              fontWeight: FontWeight.w600,
              fontSize: 25),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
