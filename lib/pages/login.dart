import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'registration_page.dart';
import '../authentication/controller/login_controller.dart';
import 'package:get/get.dart';

class Login_page extends StatefulWidget {
  const Login_page({super.key});

  @override
  State<Login_page> createState() => _Login_pageState();
}

class _Login_pageState extends State<Login_page> {
  final controller = Get.put(LoginController());

  String? errorMessage = '';
  final _formKey = GlobalKey<FormState>();

  Widget _emailTextFiels() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Color(0xFFB39DDB)),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          controller: controller.email,
          decoration: InputDecoration(
            errorStyle: TextStyle(fontSize: 15, color: Colors.deepPurple[100]),
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.email,
              color: Colors.deepPurple[900],
              size: 40,
            ),
            hintText: "Enter Email",
            labelText: "Email",
            hintStyle: TextStyle(color: Colors.deepPurple[200]),
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

  Widget _passwordTextField() {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
          border: Border.all(width: 4, color: Color(0xFFB39DDB)),
          borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: TextFormField(
          controller: controller.password,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.security,
              color: Colors.deepPurple[900],
              size: 40,
            ),
            border: InputBorder.none,
            errorStyle: TextStyle(fontSize: 15, color: Colors.deepPurple[100]),
            hintText: "Enter Password",
            labelText: "Password",
            hintStyle: TextStyle(color: Colors.deepPurple[200]),
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

  Widget _submitButton() {
    return ElevatedButton(
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
        height: 50,
        width: 110,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(
              Icons.login,
              color: Colors.deepPurple[900],
              size: 30,
            ),
            Text(
              "Login",
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
            LoginController.instance.loginUser(
                controller.email.text.trim(), controller.password.text.trim()),
            controller.password.clear()
          }
      },
    );
  }

  Widget _Registration() {
    return TextButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const registration_page()),
          );
        },
        child: Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 20),
          child: Text(
            "Create new account",
            style: TextStyle(color: Colors.deepPurple[200], fontSize: 20),
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xFFD1C4E9),
      body: SafeArea(
        child: Stack(children: [
          Container(
              decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF311B92),
                  Color(0xFFBEB0D7),
                ]),
          )),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              child: Form(
                key: _formKey,
                child: Column(children: [
                  Text(
                    "Welcome User",
                    style: TextStyle(
                        color: Color(0xFFCFBFEC),
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 32),
                    child: Column(
                      children: [
                        _emailTextFiels(),
                        _passwordTextField(),
                        _Registration(),
                        _submitButton(),
                      ],
                    ),
                  )
                ]),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
