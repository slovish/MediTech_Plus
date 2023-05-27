import 'dart:ffi';

import 'package:csc_picker/model/select_status_model.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:my_app/authentication/controller/signup_controller.dart';
import 'package:my_app/pages/login.dart';
import '../modals/User_modal.dart';
import '../authentication/user_rep.dart';
import 'package:get/get.dart';
import '../data_populating/upload.dart';

class registration_page extends StatefulWidget {
  const registration_page({super.key});

  @override
  State<registration_page> createState() => _registration_pageState();
}

class _registration_pageState extends State<registration_page> {
  String? _city = "";
  String? _state = "";
  String? _country = "";
  var name = "USER";

  Widget _emailTextFiels(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Color(0xFFB39DDB)),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 15, color: Colors.deepPurple[100]),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.email,
              color: Colors.deepPurple[900],
              size: 35,
            ),
            hintText: "albertnewton@gmail.com",
            labelText: "Email",
            hintStyle: TextStyle(color: Color.fromARGB(255, 189, 172, 221)),
            labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.w600),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Email cannot be empty";
            }
            if (!EmailValidator.validate(value)) {
              return "Invalid Email Id";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _passwordTextField(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Color(0xFFB39DDB)),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: controller,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.security,
              color: Colors.deepPurple[900],
              size: 35,
            ),
            border: InputBorder.none,
            errorStyle: TextStyle(fontSize: 15, color: Colors.deepPurple[100]),
            hintText: "Al*********n",
            labelText: "Password",
            hintStyle: TextStyle(color: Color.fromARGB(255, 177, 153, 222)),
            labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.w600),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Pass can't be empty";
            } else if (value.length < 6) {
              return "Password should be atleast 6 character";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _nameTextFiels(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Color(0xFFB39DDB)),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          onChanged: (value) {
            setState(() {
              name = value;
            });
          },
          controller: controller,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 15, color: Colors.deepPurple[100]),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.person,
              color: Colors.deepPurple[900],
              size: 35,
            ),
            hintText: "Albert Newton",
            labelText: "Full Name",
            hintStyle: TextStyle(color: Colors.deepPurple[200]),
            labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.w600),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Name cannot be empty";
            }
            if (value.isNumericOnly) {
              return "Enter valid Name ";
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _TextFiels(TextEditingController controller, int validlen,
      String thint, String tlabel, String validtext, IconData iconData) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Color(0xFFB39DDB)),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 15, color: Colors.deepPurple[100]),
            border: InputBorder.none,
            prefixIcon: Icon(
              iconData,
              color: Colors.deepPurple[900],
              size: 35,
            ),
            hintText: thint,
            labelText: tlabel,
            hintStyle: TextStyle(color: Colors.deepPurple[200]),
            labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.w600),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "*Required";
            }
            if (!value.isNumericOnly || value.length != validlen) {
              return validtext;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _addressTextFiels(TextEditingController controller) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Color(0xFFB39DDB)),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 15, color: Colors.deepPurple[100]),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.house,
              color: Colors.deepPurple[900],
              size: 35,
            ),
            hintText: "eg: Los Angeles CA 90017",
            labelText: "Address",
            hintStyle: TextStyle(color: Colors.deepPurple[200]),
            labelStyle: TextStyle(
                fontSize: 20,
                color: Colors.deepPurple[900],
                fontWeight: FontWeight.w600),
          ),
          validator: (value) {
            if (value!.isEmpty) {
              return "Address cannot be empty";
            }

            return null;
          },
        ),
      ),
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());

    User user;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.deepPurple[100],
      body: SafeArea(
        child: Stack(
          children: [
            Container(
                decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color(0xFF4527A0),
                    Color.fromARGB(255, 175, 153, 211),
                  ]),
            )),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 30.0),
                    child: SizedBox(
                      child: Text(
                        "Registration Form",
                        style: TextStyle(
                            color: Colors.deepPurple[100],
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Hello $name",
                              style: TextStyle(
                                  color: Color.fromARGB(255, 202, 185, 234),
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          _emailTextFiels(controller.email),
                          _passwordTextField(controller.password),
                          _nameTextFiels(controller.fullName),
                          SizedBox(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.48,
                                  child: _TextFiels(
                                    controller.phone,
                                    10,
                                    "8080788080",
                                    "Phone",
                                    "Enter valid phone",
                                    Icons.phone,
                                  )),
                              SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: _TextFiels(
                                    controller.pincode,
                                    6,
                                    "400000",
                                    "Pincode",
                                    "Enter valid pin",
                                    Icons.location_on,
                                  )),
                            ],
                          )),
                          _addressTextFiels(controller.address),
                          const SizedBox(
                            height: 10,
                          ),
                          CSCPicker(
                            dropdownHeadingStyle:
                                TextStyle(color: Colors.deepPurple[900]),
                            dropdownItemStyle:
                                TextStyle(color: Colors.deepPurple[900]),
                            searchBarRadius: 20,
                            selectedItemStyle: TextStyle(
                                color: Colors.deepPurple[900],
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                            defaultCountry: CscCountry.India,
                            dropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  width: 4, color: Color(0xFFB39DDB)),
                            ),
                            dropdownDialogRadius: 20,
                            disabledDropdownDecoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              border: Border.all(
                                  width: 4, color: Color(0xFFB39DDB)),
                            ),
                            onCityChanged: (value) {
                              _city = value;
                            },
                            onStateChanged: (value) {
                              _state = value;
                            },
                            onCountryChanged: (value) {
                              _country = value;
                            },
                          ),
                          Center(
                            child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Login_page()),
                                  );
                                },
                                child: Text(
                                  "Already have an Account?",
                                  style: TextStyle(
                                      color: Colors.deepPurple[200],
                                      fontSize: 20),
                                )),
                          ),
                          Center(
                              child: ElevatedButton(
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
                              width: 150,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.app_registration_rounded,
                                    color: Colors.deepPurple[900],
                                    size: 35,
                                  ),
                                  Text(
                                    "Register",
                                    style: TextStyle(
                                      color: Colors.deepPurple[900],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            onPressed: () => {
                              if (_formKey.currentState!.validate())
                                {
                                  user = User(
                                    country: _country,
                                    state: _state,
                                    city: _city,
                                    address: controller.address.text.trim(),
                                    email: controller.email.text.trim(),
                                    fullname: controller.fullName.text.trim(),
                                    password: controller.password.text.trim(),
                                    phone: controller.phone.text.trim(),
                                    pincode: controller.pincode.text.trim(),
                                  ),
                                  SignUpController.instance.createUser(user),
                                  SignUpController.instance.registerUser(
                                      controller.email.text.trim(),
                                      controller.password.text.trim()),
                                }
                            },
                          )),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
