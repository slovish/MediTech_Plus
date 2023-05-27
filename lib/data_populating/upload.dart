import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import '../modals/Doctor_modal.dart';
import 'package:flutter/material.dart';

class Doctors_repo extends GetxController {
  static Doctors_repo get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  add_doctor(Map<String, dynamic> dr) async {
    await _db
        .collection("doctors")
        .add(dr)
        .whenComplete(() => Get.snackbar("Success", "s",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Color.fromARGB(255, 76, 101, 175).withOpacity(0.1),
            colorText: Colors.green))
        .catchError((error, StackTrace) {
      Get.snackbar("error", "something went wrong",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(FlutterError.onError.toString());
    });
  }

  add_all_doctors() async {
    var li = [
      
    {
        "name": "Aarna Varma",
        "city": "Bangalore",
        "specialization": "Neurologist",
        "hospital": "Aurora, Lal and Baria",
        "age": 69,
        "rating": 3.5,
        "email": "aarnavarma@gmail.com",
        "available_days": [
            "Friday",
            "Saturday",
            "Thursday",
            "Tuesday",
            "Wednesday"
        ]
    },
    {
        "name": "Saksham Konda",
        "city": "Bangalore",
        "specialization": "Cardiologist",
        "hospital": "Vig Ltd",
        "age": 61,
        "rating": 3.3,
        "email": "sakshamkonda@gmail.com",
        "available_days": [
            "Saturday",
            "Tuesday",
            "Friday",
            "Sunday",
            "Thursday",
            "Wednesday"
        ]
    },
    {
        "name": "Saksham Bhakta",
        "city": "Bangalore",
        "specialization": "Neurologist",
        "hospital": "Dugar and Sons",
        "age": 60,
        "rating": 3.0,
        "email": "sakshambhakta@gmail.com",
        "available_days": [
            "Wednesday",
            "Monday",
            "Saturday",
            "Sunday",
            "Friday",
            "Tuesday",
            "Thursday"
        ]
    },
    {
        "name": "Sahil De",
        "city": "Bangalore",
        "specialization": "Surgeon",
        "hospital": "Bhat Inc",
        "age": 57,
        "rating": 4.0,
        "email": "sahilde@gmail.com",
        "available_days": [
            "Wednesday",
            "Thursday",
            "Sunday"
        ]
    },
    {
        "name": "Saanvi Ravi",
        "city": "Bangalore",
        "specialization": "Surgeon",
        "hospital": "Loyal-Wali",
        "age": 45,
        "rating": 4.1,
        "email": "saanviravi@gmail.com",
        "available_days": [
            "Saturday",
            "Monday",
            "Tuesday",
            "Friday",
            "Wednesday",
            "Thursday",
            "Sunday"
        ]
    },
    {
        "name": "Arhaan Balay",
        "city": "Bangalore",
        "specialization": "Dermatologist",
        "hospital": "Seshadri Group",
        "age": 59,
        "rating": 3.9,
        "email": "arhaanbalay@gmail.com",
        "available_days": [
            "Wednesday",
            "Sunday",
            "Saturday",
            "Tuesday"
        ]
    },
    {
        "name": "Devansh Sathe",
        "city": "Bangalore",
        "specialization": "Gynecologist",
        "hospital": "Shah PLC",
        "age": 26,
        "rating": 3.2,
        "email": "devanshsathe@gmail.com",
        "available_days": [
            "Thursday",
            "Sunday",
            "Wednesday",
            "Saturday",
            "Friday",
            "Tuesday",
            "Monday"
        ]
    },
    {
        "name": "Biju Srinivas",
        "city": "Bangalore",
        "specialization": "Oncologist",
        "hospital": "Dave PLC",
        "age": 56,
        "rating": 3.8,
        "email": "bijusrinivas@gmail.com",
        "available_days": [
            "Thursday",
            "Wednesday",
            "Sunday",
            "Saturday"
        ]
    },
    {
        "name": "Hiran Sankaran",
        "city": "Bangalore",
        "specialization": "Surgeon",
        "hospital": "Jaggi, Thaman and Taneja",
        "age": 40,
        "rating": 4.0,
        "email": "hiransankaran@gmail.com",
        "available_days": [
            "Saturday",
            "Monday",
            "Thursday",
            "Tuesday",
            "Friday"
        ]
    },
    {
        "name": "Ryan Batra",
        "city": "Bangalore",
        "specialization": "Pediatrician",
        "hospital": "Sastry LLC",
        "age": 33,
        "rating": 3.5,
        "email": "ryanbatra@gmail.com",
        "available_days": [
            "Tuesday",
            "Wednesday",
            "Thursday",
            "Friday",
            "Saturday",
            "Monday"
        ]
    },
    {
        "name": "Aradhya Kashyap",
        "city": "Bangalore",
        "specialization": "Radiologist",
        "hospital": "Mangat-Cherian",
        "age": 34,
        "rating": 3.7,
        "email": "aradhyakashyap@gmail.com",
        "available_days": [
            "Friday",
            "Wednesday",
            "Tuesday",
            "Sunday",
            "Monday"
        ]
    },
    {
        "name": "Dhanuk Dar",
        "city": "Bangalore",
        "specialization": "Surgeon",
        "hospital": "Dugal, Deo and Vyas",
        "age": 66,
        "rating": 3.9,
        "email": "dhanukdar@gmail.com",
        "available_days": [
            "Saturday",
            "Friday",
            "Thursday",
            "Monday"
        ]
    },
    {
        "name": "Bhamini Dada",
        "city": "Bangalore",
        "specialization": "Oncologist",
        "hospital": "Dugal and Sons",
        "age": 48,
        "rating": 4.3,
        "email": "bhaminidada@gmail.com",
        "available_days": [
            "Monday",
            "Sunday",
            "Wednesday",
            "Saturday"
        ]
    },
    {
        "name": "Urvi Das",
        "city": "Bangalore",
        "specialization": "Neurologist",
        "hospital": "Shukla and Sons",
        "age": 34,
        "rating": 4.5,
        "email": "urvidas@gmail.com",
        "available_days": [
            "Monday",
            "Saturday",
            "Friday",
            "Wednesday"
        ]
    },
    {
        "name": "Veer Kala",
        "city": "Bangalore",
        "specialization": "Psychiatrist",
        "hospital": "Magar, Varty and Soman",
        "age": 68,
        "rating": 4.3,
        "email": "veerkala@gmail.com",
        "available_days": [
            "Wednesday",
            "Tuesday",
            "Friday",
            "Thursday",
            "Monday",
            "Sunday"
        ]
    },
      {
        "name": "Biju Bumb",
        "city": "Chandigarh",
        "specialization": "Cardiologist",
        "hospital": "Sami Ltd",
        "age": 51,
        "rating": 3.0,
        "email": "bijubumb@gmail.com",
        "available_days": ["Sunday", "Saturday", "Friday", "Thursday"]
      },
      {
        "name": "Ishaan Sami",
        "city": "Chandigarh",
        "specialization": "Pediatrician",
        "hospital": "Dalal LLC",
        "age": 52,
        "rating": 4.2,
        "email": "ishaansami@gmail.com",
        "available_days": ["Sunday", "Friday"]
      },
      {
        "name": "Piya Vig",
        "city": "Chandigarh",
        "specialization": "Gynecologist",
        "hospital": "Sarma-Khatri",
        "age": 45,
        "rating": 3.6,
        "email": "piyavig@gmail.com",
        "available_days": ["Wednesday", "Friday", "Sunday", "Monday"]
      },
      {
        "name": "Rania Deep",
        "city": "Chandigarh",
        "specialization": "Gynecologist",
        "hospital": "Mammen and Sons",
        "age": 25,
        "rating": 3.9,
        "email": "raniadeep@gmail.com",
        "available_days": [
          "Monday",
          "Thursday",
          "Friday",
          "Sunday",
          "Tuesday",
          "Saturday",
          "Wednesday"
        ]
      },
      {
        "name": "Drishya Sawhney",
        "city": "Chandigarh",
        "specialization": "Psychiatrist",
        "hospital": "Tara-Banik",
        "age": 62,
        "rating": 4.9,
        "email": "drishyasawhney@gmail.com",
        "available_days": [
          "Friday",
          "Monday",
          "Saturday",
          "Wednesday",
          "Thursday",
          "Sunday"
        ]
      },
      {
        "name": "Ojas Bhatt",
        "city": "Chandigarh",
        "specialization": "Cardiologist",
        "hospital": "Cherian, Kalita and Tiwari",
        "age": 27,
        "rating": 4.5,
        "email": "ojasbhatt@gmail.com",
        "available_days": ["Tuesday", "Friday"]
      },
      {
        "name": "Umang Garg",
        "city": "Chandigarh",
        "specialization": "Endocrinologist",
        "hospital": "De, Vasa and Kannan",
        "age": 31,
        "rating": 3.9,
        "email": "umanggarg@gmail.com",
        "available_days": ["Wednesday", "Sunday", "Tuesday"]
      },
      {
        "name": "Hansh Brahmbhatt",
        "city": "Chandigarh",
        "specialization": "Radiologist",
        "hospital": "Grewal, Tella and Vaidya",
        "age": 31,
        "rating": 4.6,
        "email": "hanshbrahmbhatt@gmail.com",
        "available_days": ["Thursday", "Saturday", "Wednesday"]
      },
      {
        "name": "Ishaan Setty",
        "city": "Chandigarh",
        "specialization": "Oncologist",
        "hospital": "Biswas, Varkey and Shan",
        "age": 65,
        "rating": 3.7,
        "email": "ishaansetty@gmail.com",
        "available_days": ["Wednesday", "Monday", "Saturday"]
      },
      {
        "name": "Khushi Dhillon",
        "city": "Chandigarh",
        "specialization": "Surgeon",
        "hospital": "Bhalla-Madan",
        "age": 51,
        "rating": 4.5,
        "email": "khushidhillon@gmail.com",
        "available_days": ["Wednesday", "Monday"]
      },
      {
        "name": "Aarav Kota",
        "city": "Chandigarh",
        "specialization": "Radiologist",
        "hospital": "Bhakta, Mannan and Goel",
        "age": 61,
        "rating": 3.5,
        "email": "aaravkota@gmail.com",
        "available_days": ["Tuesday", "Wednesday", "Saturday"]
      },
      {
        "name": "Kavya Bains",
        "city": "Chandigarh",
        "specialization": "Cardiologist",
        "hospital": "Taneja LLC",
        "age": 25,
        "rating": 4.0,
        "email": "kavyabains@gmail.com",
        "available_days": [
          "Friday",
          "Wednesday",
          "Monday",
          "Saturday",
          "Tuesday"
        ]
      },
      {
        "name": "Dishani Wason",
        "city": "Chandigarh",
        "specialization": "Cardiologist",
        "hospital": "Zachariah Group",
        "age": 35,
        "rating": 3.9,
        "email": "dishaniwason@gmail.com",
        "available_days": [
          "Saturday",
          "Sunday",
          "Tuesday",
          "Thursday",
          "Monday",
          "Friday",
          "Wednesday"
        ]
      },
      {
        "name": "Amira Chhabra",
        "city": "Chandigarh",
        "specialization": "Dermatologist",
        "hospital": "Das Group",
        "age": 27,
        "rating": 3.9,
        "email": "amirachhabra@gmail.com",
        "available_days": [
          "Friday",
          "Sunday",
          "Wednesday",
          "Monday",
          "Tuesday",
          "Saturday",
          "Thursday"
        ]
      },
      {
        "name": "Tushar Balan",
        "city": "Chandigarh",
        "specialization": "Surgeon",
        "hospital": "Doshi-Varughese",
        "age": 27,
        "rating": 3.7,
        "email": "tusharbalan@gmail.com",
        "available_days": [
          "Sunday",
          "Thursday",
          "Tuesday",
          "Wednesday",
          "Saturday",
          "Friday"
        ]
      },
      
      {
        "name": "Hazel Goda",
        "city": "Chennai",
        "specialization": "Dermatologist",
        "hospital": "Hora Inc",
        "age": 61,
        "rating": 4.7,
        "email": "hazelgoda@gmail.com",
        "available_days": [
          "Monday",
          "Tuesday",
          "Sunday",
          "Wednesday",
          "Saturday",
          "Thursday",
          "Friday"
        ]
      },
      {
        "name": "Hiran Sur",
        "city": "Chennai",
        "specialization": "Pediatrician",
        "hospital": "Chanda Group",
        "age": 50,
        "rating": 3.7,
        "email": "hiransur@gmail.com",
        "available_days": [
          "Tuesday",
          "Sunday",
          "Monday",
          "Wednesday",
          "Saturday",
          "Friday"
        ]
      },
      {
        "name": "Tanya Boase",
        "city": "Chennai",
        "specialization": "Neurologist",
        "hospital": "Dhar, Tella and Bhatia",
        "age": 58,
        "rating": 3.8,
        "email": "tanyaboase@gmail.com",
        "available_days": ["Monday", "Friday"]
      },
      {
        "name": "Yakshit Bajwa",
        "city": "Chennai",
        "specialization": "Pediatrician",
        "hospital": "Karpe, Chaudhuri and Sahota",
        "age": 35,
        "rating": 3.1,
        "email": "yakshitbajwa@gmail.com",
        "available_days": [
          "Tuesday",
          "Monday",
          "Thursday",
          "Saturday",
          "Friday",
          "Sunday",
          "Wednesday"
        ]
      },
      {
        "name": "Neelofar Barad",
        "city": "Chennai",
        "specialization": "Cardiologist",
        "hospital": "Toor PLC",
        "age": 67,
        "rating": 4.4,
        "email": "neelofarbarad@gmail.com",
        "available_days": [
          "Wednesday",
          "Sunday",
          "Monday",
          "Tuesday",
          "Thursday",
          "Friday",
          "Saturday"
        ]
      },
      {
        "name": "Raunak Gour",
        "city": "Chennai",
        "specialization": "Endocrinologist",
        "hospital": "Roy Ltd",
        "age": 36,
        "rating": 4.0,
        "email": "raunakgour@gmail.com",
        "available_days": [
          "Saturday",
          "Wednesday",
          "Thursday",
          "Tuesday",
          "Sunday"
        ]
      },
      {
        "name": "Myra Rout",
        "city": "Chennai",
        "specialization": "Neurologist",
        "hospital": "Raman-Suresh",
        "age": 42,
        "rating": 4.6,
        "email": "myrarout@gmail.com",
        "available_days": ["Sunday", "Monday", "Saturday", "Thursday"]
      },
      {
        "name": "Kartik Manne",
        "city": "Chennai",
        "specialization": "Neurologist",
        "hospital": "Dayal, Bansal and Kanda",
        "age": 54,
        "rating": 4.2,
        "email": "kartikmanne@gmail.com",
        "available_days": [
          "Saturday",
          "Monday",
          "Sunday",
          "Tuesday",
          "Thursday"
        ]
      },
      {
        "name": "Chirag Reddy",
        "city": "Chennai",
        "specialization": "Radiologist",
        "hospital": "Soman-Deshmukh",
        "age": 28,
        "rating": 3.4,
        "email": "chiragreddy@gmail.com",
        "available_days": ["Wednesday", "Friday", "Monday", "Saturday"]
      },
      {
        "name": "Nitara Sachdeva",
        "city": "Chennai",
        "specialization": "Oncologist",
        "hospital": "Deol, Iyer and Bora",
        "age": 66,
        "rating": 3.1,
        "email": "nitarasachdeva@gmail.com",
        "available_days": ["Friday", "Wednesday", "Thursday", "Tuesday"]
      },
      {
        "name": "Shlok Ganguly",
        "city": "Chennai",
        "specialization": "Surgeon",
        "hospital": "Zachariah LLC",
        "age": 43,
        "rating": 3.0,
        "email": "shlokganguly@gmail.com",
        "available_days": ["Wednesday", "Sunday", "Saturday"]
      },
      {
        "name": "Adah Lalla",
        "city": "Chennai",
        "specialization": "Endocrinologist",
        "hospital": "Kuruvilla LLC",
        "age": 37,
        "rating": 4.4,
        "email": "adahlalla@gmail.com",
        "available_days": ["Wednesday", "Tuesday", "Thursday", "Saturday"]
      },
      {
        "name": "Ivana Arora",
        "city": "Chennai",
        "specialization": "Oncologist",
        "hospital": "Basak, Barman and Wason",
        "age": 56,
        "rating": 4.0,
        "email": "ivanaarora@gmail.com",
        "available_days": ["Sunday", "Monday", "Saturday"]
      },
      {
        "name": "Hridaan Kuruvilla",
        "city": "Chennai",
        "specialization": "Radiologist",
        "hospital": "Vyas, Kaur and Chaudry",
        "age": 70,
        "rating": 4.0,
        "email": "hridaankuruvilla@gmail.com",
        "available_days": ["Sunday", "Saturday", "Tuesday", "Friday"]
      },
      {
        "name": "Nishith Swamy",
        "city": "Chennai",
        "specialization": "Dermatologist",
        "hospital": "Barad LLC",
        "age": 25,
        "rating": 3.2,
        "email": "nishithswamy@gmail.com",
        "available_days": ["Monday", "Tuesday"]
      },
      
      {
        "name": "Mannat Jha",
        "city": "Delhi",
        "specialization": "Surgeon",
        "hospital": "Zachariah and Sons",
        "age": 44,
        "rating": 3.2,
        "email": "mannatjha@gmail.com",
        "available_days": [
          "Wednesday",
          "Monday",
          "Friday",
          "Saturday",
          "Tuesday"
        ]
      },
      {
        "name": "Akarsh Kant",
        "city": "Delhi",
        "specialization": "Dermatologist",
        "hospital": "Babu-Bedi",
        "age": 34,
        "rating": 4.4,
        "email": "akarshkant@gmail.com",
        "available_days": ["Wednesday", "Monday", "Thursday", "Saturday"]
      },
      {
        "name": "Sahil Chopra",
        "city": "Delhi",
        "specialization": "Pediatrician",
        "hospital": "Garg, Tata and Sampath",
        "age": 40,
        "rating": 3.5,
        "email": "sahilchopra@gmail.com",
        "available_days": ["Wednesday", "Monday", "Friday"]
      },
      {
        "name": "Romil Seshadri",
        "city": "Delhi",
        "specialization": "Psychiatrist",
        "hospital": "Dar-Som",
        "age": 65,
        "rating": 3.3,
        "email": "romilseshadri@gmail.com",
        "available_days": [
          "Friday",
          "Sunday",
          "Monday",
          "Wednesday",
          "Saturday"
        ]
      },
      {
        "name": "Hrishita Suresh",
        "city": "Delhi",
        "specialization": "Oncologist",
        "hospital": "Sani-Walia",
        "age": 41,
        "rating": 4.5,
        "email": "hrishitasuresh@gmail.com",
        "available_days": [
          "Friday",
          "Saturday",
          "Monday",
          "Tuesday",
          "Thursday"
        ]
      },
      {
        "name": "Vidur Kibe",
        "city": "Delhi",
        "specialization": "Radiologist",
        "hospital": "Divan-Dhawan",
        "age": 39,
        "rating": 3.7,
        "email": "vidurkibe@gmail.com",
        "available_days": [
          "Sunday",
          "Tuesday",
          "Friday",
          "Saturday",
          "Thursday"
        ]
      },
      {
        "name": "Renee Sankaran",
        "city": "Delhi",
        "specialization": "Radiologist",
        "hospital": "Chandran-Shenoy",
        "age": 30,
        "rating": 3.9,
        "email": "reneesankaran@gmail.com",
        "available_days": ["Saturday", "Thursday", "Monday"]
      },
      {
        "name": "Dhanuk Balakrishnan",
        "city": "Delhi",
        "specialization": "Radiologist",
        "hospital": "Bhattacharyya, Behl and Bajwa",
        "age": 57,
        "rating": 4.8,
        "email": "dhanukbalakrishnan@gmail.com",
        "available_days": [
          "Saturday",
          "Monday",
          "Tuesday",
          "Wednesday",
          "Sunday",
          "Thursday",
          "Friday"
        ]
      },
      {
        "name": "Ayesha Ratta",
        "city": "Delhi",
        "specialization": "Pediatrician",
        "hospital": "Jani, Chowdhury and Hegde",
        "age": 25,
        "rating": 4.1,
        "email": "ayesharatta@gmail.com",
        "available_days": [
          "Wednesday",
          "Sunday",
          "Tuesday",
          "Saturday",
          "Friday",
          "Monday"
        ]
      },
      {
        "name": "Ryan Bava",
        "city": "Delhi",
        "specialization": "Pediatrician",
        "hospital": "Bahl PLC",
        "age": 50,
        "rating": 4.1,
        "email": "ryanbava@gmail.com",
        "available_days": [
          "Tuesday",
          "Thursday",
          "Saturday",
          "Friday",
          "Wednesday"
        ]
      },
      {
        "name": "Nirvi Sethi",
        "city": "Delhi",
        "specialization": "Endocrinologist",
        "hospital": "Biswas Inc",
        "age": 43,
        "rating": 3.6,
        "email": "nirvisethi@gmail.com",
        "available_days": [
          "Saturday",
          "Tuesday",
          "Thursday",
          "Wednesday",
          "Monday",
          "Friday"
        ]
      },
      {
        "name": "Rohan Lad",
        "city": "Delhi",
        "specialization": "Cardiologist",
        "hospital": "Edwin, Loke and Brahmbhatt",
        "age": 63,
        "rating": 4.4,
        "email": "rohanlad@gmail.com",
        "available_days": ["Wednesday", "Thursday", "Friday"]
      },
      {
        "name": "Tara Sarma",
        "city": "Delhi",
        "specialization": "Psychiatrist",
        "hospital": "Apte-Verma",
        "age": 32,
        "rating": 4.0,
        "email": "tarasarma@gmail.com",
        "available_days": [
          "Thursday",
          "Friday",
          "Tuesday",
          "Wednesday",
          "Sunday",
          "Saturday"
        ]
      },
      {
        "name": "Urvi Bhattacharyya",
        "city": "Delhi",
        "specialization": "Dermatologist",
        "hospital": "Sheth, Rau and Din",
        "age": 26,
        "rating": 3.0,
        "email": "urvibhattacharyya@gmail.com",
        "available_days": [
          "Thursday",
          "Wednesday",
          "Tuesday",
          "Sunday",
          "Friday",
          "Monday"
        ]
      },
      {
        "name": "Tiya Choudhry",
        "city": "Delhi",
        "specialization": "Surgeon",
        "hospital": "Gera-Wadhwa",
        "age": 26,
        "rating": 4.7,
        "email": "tiyachoudhry@gmail.com",
        "available_days": ["Thursday", "Tuesday", "Friday", "Sunday", "Monday"]
      },

      
      {
        "name": "Shaan Tank",
        "city": "Hyderabad",
        "specialization": "Dermatologist",
        "hospital": "Kale PLC",
        "age": 30,
        "rating": 3.1,
        "email": "shaantank@gmail.com",
        "available_days": ["Friday", "Wednesday", "Saturday"]
      },
      {
        "name": "Vritika Gade",
        "city": "Hyderabad",
        "specialization": "Cardiologist",
        "hospital": "Mandal-Dutt",
        "age": 51,
        "rating": 3.4,
        "email": "vritikagade@gmail.com",
        "available_days": ["Friday", "Tuesday"]
      },
      {
        "name": "Heer Seshadri",
        "city": "Hyderabad",
        "specialization": "Endocrinologist",
        "hospital": "Sama-Rege",
        "age": 26,
        "rating": 4.5,
        "email": "heerseshadri@gmail.com",
        "available_days": ["Sunday", "Thursday", "Saturday", "Wednesday"]
      },
      {
        "name": "Indrans Upadhyay",
        "city": "Hyderabad",
        "specialization": "Oncologist",
        "hospital": "Doshi Inc",
        "age": 49,
        "rating": 3.7,
        "email": "indransupadhyay@gmail.com",
        "available_days": ["Sunday", "Monday"]
      },
      {
        "name": "Tarini Banik",
        "city": "Hyderabad",
        "specialization": "Radiologist",
        "hospital": "Deep, Kade and Sampath",
        "age": 50,
        "rating": 3.4,
        "email": "tarinibanik@gmail.com",
        "available_days": [
          "Tuesday",
          "Thursday",
          "Sunday",
          "Wednesday",
          "Saturday",
          "Monday"
        ]
      },
      {
        "name": "Elakshi Seth",
        "city": "Hyderabad",
        "specialization": "Surgeon",
        "hospital": "Ganesh-Balay",
        "age": 35,
        "rating": 3.2,
        "email": "elakshiseth@gmail.com",
        "available_days": [
          "Monday",
          "Sunday",
          "Tuesday",
          "Wednesday",
          "Thursday",
          "Friday"
        ]
      },
      {
        "name": "Divyansh Sarraf",
        "city": "Hyderabad",
        "specialization": "Pediatrician",
        "hospital": "Kari-Som",
        "age": 57,
        "rating": 3.3,
        "email": "divyanshsarraf@gmail.com",
        "available_days": [
          "Wednesday",
          "Tuesday",
          "Monday",
          "Friday",
          "Saturday"
        ]
      },
      {
        "name": "Inaaya  Dar",
        "city": "Hyderabad",
        "specialization": "Cardiologist",
        "hospital": "Bhakta-Loyal",
        "age": 38,
        "rating": 4.5,
        "email": "inaayadar@gmail.com",
        "available_days": ["Wednesday", "Monday"]
      },
      {
        "name": "Yuvaan Doctor",
        "city": "Hyderabad",
        "specialization": "Psychiatrist",
        "hospital": "Boase, Vora and Chandra",
        "age": 30,
        "rating": 4.8,
        "email": "yuvaandoctor@gmail.com",
        "available_days": [
          "Thursday",
          "Saturday",
          "Monday",
          "Sunday",
          "Wednesday",
          "Friday",
          "Tuesday"
        ]
      },
      {
        "name": "Anaya Solanki",
        "city": "Hyderabad",
        "specialization": "Oncologist",
        "hospital": "Choudhry-Wason",
        "age": 57,
        "rating": 4.6,
        "email": "anayasolanki@gmail.com",
        "available_days": [
          "Saturday",
          "Sunday",
          "Monday",
          "Tuesday",
          "Thursday",
          "Friday"
        ]
      },
      {
        "name": "Lagan Bhatt",
        "city": "Hyderabad",
        "specialization": "Radiologist",
        "hospital": "Datta Ltd",
        "age": 26,
        "rating": 3.4,
        "email": "laganbhatt@gmail.com",
        "available_days": [
          "Tuesday",
          "Thursday",
          "Sunday",
          "Monday",
          "Saturday"
        ]
      },
      {
        "name": "Jivin Bassi",
        "city": "Hyderabad",
        "specialization": "Surgeon",
        "hospital": "Dubey PLC",
        "age": 33,
        "rating": 3.1,
        "email": "jivinbassi@gmail.com",
        "available_days": ["Thursday", "Friday", "Monday", "Sunday", "Tuesday"]
      },
      {
        "name": "Kismat Magar",
        "city": "Hyderabad",
        "specialization": "Psychiatrist",
        "hospital": "Sridhar, Kakar and Sawhney",
        "age": 47,
        "rating": 4.1,
        "email": "kismatmagar@gmail.com",
        "available_days": [
          "Thursday",
          "Friday",
          "Sunday",
          "Saturday",
          "Tuesday",
          "Monday",
          "Wednesday"
        ]
      },
      {
        "name": "Tarini Jayaraman",
        "city": "Hyderabad",
        "specialization": "Surgeon",
        "hospital": "Sagar, Vohra and Koshy",
        "age": 58,
        "rating": 4.6,
        "email": "tarinijayaraman@gmail.com",
        "available_days": ["Thursday", "Sunday"]
      },
      {
        "name": "Yuvraj  Char",
        "city": "Hyderabad",
        "specialization": "Dermatologist",
        "hospital": "Bala PLC",
        "age": 26,
        "rating": 3.2,
        "email": "yuvrajchar@gmail.com",
        "available_days": ["Sunday", "Thursday", "Saturday", "Monday", "Friday"]
      },
      
      {
        "name": "Anvi Ganesan",
        "city": "Indore",
        "specialization": "Radiologist",
        "hospital": "Dora-Ghose",
        "age": 49,
        "rating": 4.9,
        "email": "anviganesan@gmail.com",
        "available_days": ["Sunday", "Monday", "Tuesday", "Wednesday", "Friday"]
      },
      {
        "name": "Keya Jayaraman",
        "city": "Indore",
        "specialization": "Pediatrician",
        "hospital": "Khurana, Dyal and Venkataraman",
        "age": 52,
        "rating": 3.7,
        "email": "keyajayaraman@gmail.com",
        "available_days": [
          "Sunday",
          "Wednesday",
          "Monday",
          "Thursday",
          "Saturday",
          "Tuesday",
          "Friday"
        ]
      },
      {
        "name": "Ryan Rajagopalan",
        "city": "Indore",
        "specialization": "Oncologist",
        "hospital": "Hayre, Sundaram and Mangal",
        "age": 26,
        "rating": 4.3,
        "email": "ryanrajagopalan@gmail.com",
        "available_days": [
          "Wednesday",
          "Monday",
          "Sunday",
          "Saturday",
          "Thursday",
          "Friday"
        ]
      },
      {
        "name": "Madhav Luthra",
        "city": "Indore",
        "specialization": "Oncologist",
        "hospital": "Bali, Master and Bandi",
        "age": 59,
        "rating": 4.6,
        "email": "madhavluthra@gmail.com",
        "available_days": ["Thursday", "Saturday"]
      },
      {
        "name": "Rohan Desai",
        "city": "Indore",
        "specialization": "Psychiatrist",
        "hospital": "Ramanathan Inc",
        "age": 54,
        "rating": 4.1,
        "email": "rohandesai@gmail.com",
        "available_days": [
          "Saturday",
          "Tuesday",
          "Friday",
          "Thursday",
          "Monday",
          "Wednesday"
        ]
      },
      {
        "name": "Arnav Sidhu",
        "city": "Indore",
        "specialization": "Gynecologist",
        "hospital": "Saini-Tella",
        "age": 70,
        "rating": 3.1,
        "email": "arnavsidhu@gmail.com",
        "available_days": ["Thursday", "Tuesday"]
      },
      {
        "name": "Renee Chada",
        "city": "Indore",
        "specialization": "Dermatologist",
        "hospital": "Mandal-Gandhi",
        "age": 28,
        "rating": 3.3,
        "email": "reneechada@gmail.com",
        "available_days": [
          "Wednesday",
          "Monday",
          "Thursday",
          "Friday",
          "Sunday",
          "Tuesday"
        ]
      },
      {
        "name": "Lavanya Khare",
        "city": "Indore",
        "specialization": "Neurologist",
        "hospital": "Dave, Shenoy and Samra",
        "age": 61,
        "rating": 4.5,
        "email": "lavanyakhare@gmail.com",
        "available_days": ["Saturday", "Monday", "Wednesday", "Thursday"]
      },
      {
        "name": "Emir Rajan",
        "city": "Indore",
        "specialization": "Radiologist",
        "hospital": "Chatterjee-Jaggi",
        "age": 65,
        "rating": 3.1,
        "email": "emirrajan@gmail.com",
        "available_days": [
          "Friday",
          "Sunday",
          "Saturday",
          "Monday",
          "Tuesday",
          "Thursday",
          "Wednesday"
        ]
      },
      {
        "name": "Aaina Kata",
        "city": "Indore",
        "specialization": "Cardiologist",
        "hospital": "Sachar LLC",
        "age": 68,
        "rating": 3.5,
        "email": "aainakata@gmail.com",
        "available_days": [
          "Saturday",
          "Sunday",
          "Friday",
          "Wednesday",
          "Tuesday"
        ]
      },
      {
        "name": "Baiju Johal",
        "city": "Indore",
        "specialization": "Psychiatrist",
        "hospital": "Varghese Ltd",
        "age": 37,
        "rating": 3.7,
        "email": "baijujohal@gmail.com",
        "available_days": ["Tuesday", "Saturday", "Monday"]
      },
      {
        "name": "Charvi Loke",
        "city": "Indore",
        "specialization": "Cardiologist",
        "hospital": "Jani PLC",
        "age": 61,
        "rating": 4.5,
        "email": "charviloke@gmail.com",
        "available_days": [
          "Friday",
          "Monday",
          "Saturday",
          "Wednesday",
          "Sunday",
          "Tuesday"
        ]
      },
      {
        "name": "Lakshit Subramaniam",
        "city": "Indore",
        "specialization": "Dermatologist",
        "hospital": "Banik-Ghose",
        "age": 48,
        "rating": 4.9,
        "email": "lakshitsubramaniam@gmail.com",
        "available_days": ["Friday", "Sunday", "Tuesday", "Saturday"]
      },
      {
        "name": "Vritika Shukla",
        "city": "Indore",
        "specialization": "Psychiatrist",
        "hospital": "Chaudry Inc",
        "age": 62,
        "rating": 3.3,
        "email": "vritikashukla@gmail.com",
        "available_days": ["Thursday", "Monday", "Tuesday"]
      },
      {
        "name": "Vihaan Varghese",
        "city": "Indore",
        "specialization": "Dermatologist",
        "hospital": "Jani, Gupta and Walia",
        "age": 48,
        "rating": 4.7,
        "email": "vihaanvarghese@gmail.com",
        "available_days": [
          "Tuesday",
          "Wednesday",
          "Monday",
          "Sunday",
          "Thursday",
          "Friday"
        ]
      },
      
      {
        "name": "Emir Mannan",
        "city": "Kolkata",
        "specialization": "Oncologist",
        "hospital": "Saha, Kanda and Kalla",
        "age": 56,
        "rating": 3.7,
        "email": "emirmannan@gmail.com",
        "available_days": ["Saturday", "Sunday", "Thursday"]
      },
      {
        "name": "Suhana Iyer",
        "city": "Kolkata",
        "specialization": "Surgeon",
        "hospital": "Chaudhary Group",
        "age": 29,
        "rating": 3.0,
        "email": "suhanaiyer@gmail.com",
        "available_days": ["Saturday", "Monday", "Sunday"]
      },
      {
        "name": "Ranbir Tailor",
        "city": "Kolkata",
        "specialization": "Cardiologist",
        "hospital": "Golla Group",
        "age": 39,
        "rating": 3.6,
        "email": "ranbirtailor@gmail.com",
        "available_days": [
          "Wednesday",
          "Friday",
          "Monday",
          "Sunday",
          "Saturday"
        ]
      },
      {
        "name": "Azad Raj",
        "city": "Kolkata",
        "specialization": "Oncologist",
        "hospital": "Kapoor, Issac and Bobal",
        "age": 35,
        "rating": 3.0,
        "email": "azadraj@gmail.com",
        "available_days": [
          "Saturday",
          "Tuesday",
          "Wednesday",
          "Monday",
          "Sunday",
          "Thursday",
          "Friday"
        ]
      },
      {
        "name": "Shlok Cherian",
        "city": "Kolkata",
        "specialization": "Cardiologist",
        "hospital": "Thaman-Ramanathan",
        "age": 60,
        "rating": 3.5,
        "email": "shlokcherian@gmail.com",
        "available_days": [
          "Saturday",
          "Thursday",
          "Wednesday",
          "Sunday",
          "Tuesday",
          "Friday"
        ]
      },
      {
        "name": "Chirag Rana",
        "city": "Kolkata",
        "specialization": "Psychiatrist",
        "hospital": "Borah LLC",
        "age": 30,
        "rating": 3.4,
        "email": "chiragrana@gmail.com",
        "available_days": ["Sunday", "Saturday", "Wednesday", "Thursday"]
      },
      {
        "name": "Faiyaz Reddy",
        "city": "Kolkata",
        "specialization": "Neurologist",
        "hospital": "Lall-Hayer",
        "age": 49,
        "rating": 4.6,
        "email": "faiyazreddy@gmail.com",
        "available_days": [
          "Tuesday",
          "Sunday",
          "Thursday",
          "Saturday",
          "Friday",
          "Wednesday"
        ]
      },
      {
        "name": "Rohan Bhatt",
        "city": "Kolkata",
        "specialization": "Dermatologist",
        "hospital": "Kohli and Sons",
        "age": 40,
        "rating": 4.1,
        "email": "rohanbhatt@gmail.com",
        "available_days": ["Saturday", "Tuesday", "Monday"]
      },
      {
        "name": "Keya Keer",
        "city": "Kolkata",
        "specialization": "Oncologist",
        "hospital": "Vyas LLC",
        "age": 69,
        "rating": 3.1,
        "email": "keyakeer@gmail.com",
        "available_days": ["Friday", "Sunday", "Saturday", "Monday", "Thursday"]
      },
      {
        "name": "Sara Dhar",
        "city": "Kolkata",
        "specialization": "Surgeon",
        "hospital": "Gara-Sarkar",
        "age": 29,
        "rating": 4.9,
        "email": "saradhar@gmail.com",
        "available_days": [
          "Sunday",
          "Wednesday",
          "Monday",
          "Tuesday",
          "Saturday",
          "Friday"
        ]
      },
      {
        "name": "Kashvi Sengupta",
        "city": "Kolkata",
        "specialization": "Gynecologist",
        "hospital": "Kala-Baral",
        "age": 60,
        "rating": 4.8,
        "email": "kashvisengupta@gmail.com",
        "available_days": [
          "Monday",
          "Friday",
          "Saturday",
          "Thursday",
          "Wednesday",
          "Sunday",
          "Tuesday"
        ]
      },
      {
        "name": "Shalv Sami",
        "city": "Kolkata",
        "specialization": "Psychiatrist",
        "hospital": "Sabharwal Inc",
        "age": 27,
        "rating": 4.1,
        "email": "shalvsami@gmail.com",
        "available_days": ["Thursday", "Monday", "Sunday", "Tuesday"]
      },
      {
        "name": "Jiya Saraf",
        "city": "Kolkata",
        "specialization": "Psychiatrist",
        "hospital": "Kibe, Barad and Mander",
        "age": 66,
        "rating": 3.6,
        "email": "jiyasaraf@gmail.com",
        "available_days": ["Wednesday", "Monday", "Thursday", "Saturday"]
      },
      {
        "name": "Anika Yogi",
        "city": "Kolkata",
        "specialization": "Dermatologist",
        "hospital": "Johal-Dugar",
        "age": 34,
        "rating": 3.7,
        "email": "anikayogi@gmail.com",
        "available_days": ["Monday", "Sunday", "Thursday"]
      },
      {
        "name": "Rhea Madan",
        "city": "Kolkata",
        "specialization": "Psychiatrist",
        "hospital": "Trivedi-Wable",
        "age": 55,
        "rating": 3.1,
        "email": "rheamadan@gmail.com",
        "available_days": ["Friday", "Wednesday", "Tuesday"]
      },
      
      {
        "name": "Nitya Lanka",
        "city": "Mumbai",
        "specialization": "Radiologist",
        "hospital": "Walia-Swamy",
        "age": 52,
        "rating": 3.0,
        "email": "nityalanka@gmail.com",
        "available_days": ["Monday", "Thursday", "Tuesday", "Saturday"]
      },
      {
        "name": "Myra Chhabra",
        "city": "Mumbai",
        "specialization": "Gynecologist",
        "hospital": "Dani-Ramanathan",
        "age": 69,
        "rating": 4.8,
        "email": "myrachhabra@gmail.com",
        "available_days": ["Tuesday", "Wednesday", "Sunday", "Friday"]
      },
      {
        "name": "Mishti Rao",
        "city": "Mumbai",
        "specialization": "Psychiatrist",
        "hospital": "Sundaram, Tripathi and Magar",
        "age": 28,
        "rating": 4.8,
        "email": "mishtirao@gmail.com",
        "available_days": [
          "Tuesday",
          "Sunday",
          "Friday",
          "Monday",
          "Saturday",
          "Wednesday"
        ]
      },
      {
        "name": "Pranay Rama",
        "city": "Mumbai",
        "specialization": "Cardiologist",
        "hospital": "Roy Inc",
        "age": 61,
        "rating": 4.8,
        "email": "pranayrama@gmail.com",
        "available_days": ["Tuesday", "Wednesday", "Sunday", "Saturday"]
      },
      {
        "name": "Hiran Borde",
        "city": "Mumbai",
        "specialization": "Surgeon",
        "hospital": "Sachdeva and Sons",
        "age": 67,
        "rating": 4.9,
        "email": "hiranborde@gmail.com",
        "available_days": [
          "Monday",
          "Tuesday",
          "Friday",
          "Saturday",
          "Thursday",
          "Wednesday",
          "Sunday"
        ]
      },
      {
        "name": "Nitara Lala",
        "city": "Mumbai",
        "specialization": "Psychiatrist",
        "hospital": "Brahmbhatt Ltd",
        "age": 39,
        "rating": 4.2,
        "email": "nitaralala@gmail.com",
        "available_days": ["Friday", "Wednesday", "Tuesday", "Sunday", "Monday"]
      },
      {
        "name": "Ivan Bala",
        "city": "Mumbai",
        "specialization": "Radiologist",
        "hospital": "Arora, Agate and Sankar",
        "age": 61,
        "rating": 4.6,
        "email": "ivanbala@gmail.com",
        "available_days": [
          "Sunday",
          "Friday",
          "Wednesday",
          "Saturday",
          "Thursday"
        ]
      },
      {
        "name": "Fateh Acharya",
        "city": "Mumbai",
        "specialization": "Pediatrician",
        "hospital": "Sami, Chand and Tandon",
        "age": 38,
        "rating": 4.2,
        "email": "fatehacharya@gmail.com",
        "available_days": ["Sunday", "Wednesday", "Saturday"]
      },
      {
        "name": "Mannat Dube",
        "city": "Mumbai",
        "specialization": "Neurologist",
        "hospital": "Mann, Balay and Karan",
        "age": 59,
        "rating": 4.1,
        "email": "mannatdube@gmail.com",
        "available_days": ["Thursday", "Wednesday", "Saturday"]
      },
      {
        "name": "Jivika Badami",
        "city": "Mumbai",
        "specialization": "Endocrinologist",
        "hospital": "Bhakta-Sharma",
        "age": 43,
        "rating": 4.0,
        "email": "jivikabadami@gmail.com",
        "available_days": ["Monday", "Friday"]
      },
      {
        "name": "Stuvan Hari",
        "city": "Mumbai",
        "specialization": "Radiologist",
        "hospital": "Cheema-Mangat",
        "age": 28,
        "rating": 4.9,
        "email": "stuvanhari@gmail.com",
        "available_days": [
          "Thursday",
          "Saturday",
          "Tuesday",
          "Sunday",
          "Friday"
        ]
      },
      {
        "name": "Ahana  Sama",
        "city": "Mumbai",
        "specialization": "Psychiatrist",
        "hospital": "Banerjee-Bhalla",
        "age": 69,
        "rating": 3.3,
        "email": "ahanasama@gmail.com",
        "available_days": ["Tuesday", "Thursday", "Sunday", "Friday"]
      },
      {
        "name": "Drishya Krishnan",
        "city": "Mumbai",
        "specialization": "Cardiologist",
        "hospital": "Mammen PLC",
        "age": 29,
        "rating": 3.9,
        "email": "drishyakrishnan@gmail.com",
        "available_days": [
          "Wednesday",
          "Sunday",
          "Tuesday",
          "Saturday",
          "Thursday"
        ]
      },
      {
        "name": "Nirvaan Dua",
        "city": "Mumbai",
        "specialization": "Cardiologist",
        "hospital": "Vyas-Soman",
        "age": 43,
        "rating": 4.9,
        "email": "nirvaandua@gmail.com",
        "available_days": ["Tuesday", "Wednesday"]
      },
      {
        "name": "Vritika Gokhale",
        "city": "Mumbai",
        "specialization": "Pediatrician",
        "hospital": "Ramakrishnan, Chandran and Tandon",
        "age": 26,
        "rating": 3.7,
        "email": "vritikagokhale@gmail.com",
        "available_days": ["Thursday", "Wednesday", "Monday", "Saturday"]
      },
      
      {
        "name": "Eshani Dave",
        "city": "Nagpur",
        "specialization": "Gynecologist",
        "hospital": "Bhakta, Lalla and Chada",
        "age": 33,
        "rating": 3.5,
        "email": "eshanidave@gmail.com",
        "available_days": [
          "Wednesday",
          "Sunday",
          "Tuesday",
          "Saturday",
          "Friday",
          "Thursday"
        ]
      },
      {
        "name": "Nakul Chokshi",
        "city": "Nagpur",
        "specialization": "Psychiatrist",
        "hospital": "Bhagat and Sons",
        "age": 35,
        "rating": 4.0,
        "email": "nakulchokshi@gmail.com",
        "available_days": ["Wednesday", "Saturday", "Monday", "Tuesday"]
      },
      {
        "name": "Vidur Sule",
        "city": "Nagpur",
        "specialization": "Dermatologist",
        "hospital": "Saxena, Wagle and Shere",
        "age": 58,
        "rating": 3.6,
        "email": "vidursule@gmail.com",
        "available_days": [
          "Wednesday",
          "Saturday",
          "Monday",
          "Friday",
          "Tuesday",
          "Thursday",
          "Sunday"
        ]
      },
      {
        "name": "Hrishita Viswanathan",
        "city": "Nagpur",
        "specialization": "Endocrinologist",
        "hospital": "Babu-Apte",
        "age": 44,
        "rating": 3.8,
        "email": "hrishitaviswanathan@gmail.com",
        "available_days": ["Tuesday", "Wednesday"]
      },
      {
        "name": "Tanya Datta",
        "city": "Nagpur",
        "specialization": "Neurologist",
        "hospital": "Chada LLC",
        "age": 29,
        "rating": 3.7,
        "email": "tanyadatta@gmail.com",
        "available_days": [
          "Friday",
          "Sunday",
          "Thursday",
          "Tuesday",
          "Wednesday",
          "Saturday"
        ]
      },
      {
        "name": "Prerak Agarwal",
        "city": "Nagpur",
        "specialization": "Gynecologist",
        "hospital": "Anne and Sons",
        "age": 34,
        "rating": 4.2,
        "email": "prerakagarwal@gmail.com",
        "available_days": [
          "Wednesday",
          "Tuesday",
          "Friday",
          "Thursday",
          "Sunday"
        ]
      },
      {
        "name": "Zoya Sarraf",
        "city": "Nagpur",
        "specialization": "Oncologist",
        "hospital": "Malhotra, Bir and Jha",
        "age": 40,
        "rating": 4.0,
        "email": "zoyasarraf@gmail.com",
        "available_days": [
          "Wednesday",
          "Saturday",
          "Friday",
          "Tuesday",
          "Sunday",
          "Monday"
        ]
      },
      {
        "name": "Yakshit Sekhon",
        "city": "Nagpur",
        "specialization": "Neurologist",
        "hospital": "Agarwal, Bal and Kala",
        "age": 65,
        "rating": 4.4,
        "email": "yakshitsekhon@gmail.com",
        "available_days": [
          "Tuesday",
          "Thursday",
          "Sunday",
          "Friday",
          "Saturday",
          "Monday",
          "Wednesday"
        ]
      },
      {
        "name": "Sumer Tak",
        "city": "Nagpur",
        "specialization": "Psychiatrist",
        "hospital": "Saha, Krish and Borde",
        "age": 29,
        "rating": 3.5,
        "email": "sumertak@gmail.com",
        "available_days": [
          "Wednesday",
          "Sunday",
          "Thursday",
          "Saturday",
          "Monday",
          "Tuesday",
          "Friday"
        ]
      },
      {
        "name": "Neysa Chahal",
        "city": "Nagpur",
        "specialization": "Surgeon",
        "hospital": "Tailor Group",
        "age": 62,
        "rating": 4.4,
        "email": "neysachahal@gmail.com",
        "available_days": [
          "Tuesday",
          "Wednesday",
          "Monday",
          "Friday",
          "Saturday",
          "Sunday",
          "Thursday"
        ]
      },
      {
        "name": "Aniruddh Hari",
        "city": "Nagpur",
        "specialization": "Surgeon",
        "hospital": "Vyas-Bhandari",
        "age": 61,
        "rating": 3.0,
        "email": "aniruddhhari@gmail.com",
        "available_days": [
          "Sunday",
          "Wednesday",
          "Saturday",
          "Thursday",
          "Monday",
          "Friday"
        ]
      },
      {
        "name": "Ryan Chaudry",
        "city": "Nagpur",
        "specialization": "Oncologist",
        "hospital": "Amble, Dhawan and Warrior",
        "age": 33,
        "rating": 4.2,
        "email": "ryanchaudry@gmail.com",
        "available_days": [
          "Friday",
          "Wednesday",
          "Saturday",
          "Tuesday",
          "Monday",
          "Thursday",
          "Sunday"
        ]
      },
      {
        "name": "Jayan Dyal",
        "city": "Nagpur",
        "specialization": "Pediatrician",
        "hospital": "Gill-Khanna",
        "age": 31,
        "rating": 3.1,
        "email": "jayandyal@gmail.com",
        "available_days": [
          "Saturday",
          "Thursday",
          "Friday",
          "Sunday",
          "Monday",
          "Wednesday",
          "Tuesday"
        ]
      },
      {
        "name": "Siya Sastry",
        "city": "Nagpur",
        "specialization": "Pediatrician",
        "hospital": "Chandra-Sinha",
        "age": 37,
        "rating": 4.9,
        "email": "siyasastry@gmail.com",
        "available_days": ["Friday", "Tuesday"]
      },
      {
        "name": "Ela Seth",
        "city": "Nagpur",
        "specialization": "Cardiologist",
        "hospital": "Bawa and Sons",
        "age": 48,
        "rating": 3.3,
        "email": "elaseth@gmail.com",
        "available_days": ["Saturday", "Friday", "Wednesday", "Thursday"]
      },
      
      {
        "name": "Oorja Kara",
        "city": "Patna",
        "specialization": "Dermatologist",
        "hospital": "Dash-Sawhney",
        "age": 63,
        "rating": 3.4,
        "email": "oorjakara@gmail.com",
        "available_days": [
          "Friday",
          "Monday",
          "Saturday",
          "Thursday",
          "Wednesday",
          "Sunday",
          "Tuesday"
        ]
      },
      {
        "name": "Sara Shankar",
        "city": "Patna",
        "specialization": "Oncologist",
        "hospital": "Chad, Bhat and Sheth",
        "age": 25,
        "rating": 4.7,
        "email": "sarashankar@gmail.com",
        "available_days": [
          "Friday",
          "Monday",
          "Thursday",
          "Sunday",
          "Tuesday",
          "Wednesday"
        ]
      },
      {
        "name": "Urvi Bahl",
        "city": "Patna",
        "specialization": "Gynecologist",
        "hospital": "Ramaswamy, Rana and Rajagopal",
        "age": 63,
        "rating": 4.6,
        "email": "urvibahl@gmail.com",
        "available_days": ["Tuesday", "Thursday", "Wednesday"]
      },
      {
        "name": "Divit Sankaran",
        "city": "Patna",
        "specialization": "Radiologist",
        "hospital": "Sarma, Trivedi and Garg",
        "age": 28,
        "rating": 3.7,
        "email": "divitsankaran@gmail.com",
        "available_days": ["Monday", "Sunday", "Tuesday"]
      },
      {
        "name": "Suhana Sem",
        "city": "Patna",
        "specialization": "Surgeon",
        "hospital": "Gill-Tella",
        "age": 27,
        "rating": 3.6,
        "email": "suhanasem@gmail.com",
        "available_days": ["Saturday", "Friday"]
      },
      {
        "name": "Anaya Chhabra",
        "city": "Patna",
        "specialization": "Psychiatrist",
        "hospital": "Konda-Rattan",
        "age": 33,
        "rating": 4.4,
        "email": "anayachhabra@gmail.com",
        "available_days": ["Friday", "Thursday"]
      },
      {
        "name": "Ayesha Krishna",
        "city": "Patna",
        "specialization": "Oncologist",
        "hospital": "Warrior, Barman and Kade",
        "age": 50,
        "rating": 3.0,
        "email": "ayeshakrishna@gmail.com",
        "available_days": [
          "Friday",
          "Sunday",
          "Wednesday",
          "Saturday",
          "Tuesday",
          "Monday"
        ]
      },
      {
        "name": "Adira Bath",
        "city": "Patna",
        "specialization": "Cardiologist",
        "hospital": "Gade, Tak and Khare",
        "age": 39,
        "rating": 3.0,
        "email": "adirabath@gmail.com",
        "available_days": [
          "Friday",
          "Monday",
          "Thursday",
          "Sunday",
          "Tuesday",
          "Wednesday"
        ]
      },
      {
        "name": "Faiyaz Raval",
        "city": "Patna",
        "specialization": "Oncologist",
        "hospital": "Gara-Mand",
        "age": 49,
        "rating": 4.8,
        "email": "faiyazraval@gmail.com",
        "available_days": [
          "Wednesday",
          "Monday",
          "Friday",
          "Thursday",
          "Saturday"
        ]
      },
      {
        "name": "Ayesha Kala",
        "city": "Patna",
        "specialization": "Surgeon",
        "hospital": "Ghose and Sons",
        "age": 35,
        "rating": 3.6,
        "email": "ayeshakala@gmail.com",
        "available_days": ["Wednesday", "Saturday"]
      },
      {
        "name": "Yakshit Setty",
        "city": "Patna",
        "specialization": "Neurologist",
        "hospital": "Jain, Bora and Halder",
        "age": 39,
        "rating": 3.3,
        "email": "yakshitsetty@gmail.com",
        "available_days": [
          "Saturday",
          "Sunday",
          "Tuesday",
          "Friday",
          "Wednesday"
        ]
      },
      {
        "name": "Alia Bhattacharyya",
        "city": "Patna",
        "specialization": "Gynecologist",
        "hospital": "Bala-Tailor",
        "age": 55,
        "rating": 3.5,
        "email": "aliabhattacharyya@gmail.com",
        "available_days": [
          "Wednesday",
          "Saturday",
          "Sunday",
          "Thursday",
          "Monday",
          "Friday"
        ]
      },
      {
        "name": "Anya Gaba",
        "city": "Patna",
        "specialization": "Surgeon",
        "hospital": "Mani Group",
        "age": 30,
        "rating": 4.1,
        "email": "anyagaba@gmail.com",
        "available_days": ["Monday", "Saturday"]
      },
      {
        "name": "Vivaan Sodhi",
        "city": "Patna",
        "specialization": "Neurologist",
        "hospital": "Shere LLC",
        "age": 44,
        "rating": 3.6,
        "email": "vivaansodhi@gmail.com",
        "available_days": [
          "Tuesday",
          "Sunday",
          "Wednesday",
          "Thursday",
          "Friday",
          "Monday",
          "Saturday"
        ]
      },
      {
        "name": "Riya Venkatesh",
        "city": "Patna",
        "specialization": "Dermatologist",
        "hospital": "Bath Inc",
        "age": 60,
        "rating": 4.0,
        "email": "riyavenkatesh@gmail.com",
        "available_days": [
          "Friday",
          "Wednesday",
          "Thursday",
          "Tuesday",
          "Saturday",
          "Sunday"
        ]
      },
      
      {
        "name": "Oorja Chaudhry",
        "city": "Pune",
        "specialization": "Endocrinologist",
        "hospital": "Chaudhari Inc",
        "age": 67,
        "rating": 4.4,
        "email": "oorjachaudhry@gmail.com",
        "available_days": [
          "Friday",
          "Tuesday",
          "Saturday",
          "Thursday",
          "Monday"
        ]
      },
      {
        "name": "Akarsh Gaba",
        "city": "Pune",
        "specialization": "Neurologist",
        "hospital": "Mahajan-Sane",
        "age": 39,
        "rating": 4.4,
        "email": "akarshgaba@gmail.com",
        "available_days": [
          "Tuesday",
          "Sunday",
          "Monday",
          "Thursday",
          "Friday",
          "Wednesday"
        ]
      },
      {
        "name": "Suhana Garg",
        "city": "Pune",
        "specialization": "Surgeon",
        "hospital": "Raja PLC",
        "age": 55,
        "rating": 3.9,
        "email": "suhanagarg@gmail.com",
        "available_days": ["Saturday", "Monday"]
      },
      {
        "name": "Arnav Butala",
        "city": "Pune",
        "specialization": "Cardiologist",
        "hospital": "Jaggi, Sant and Malhotra",
        "age": 51,
        "rating": 3.0,
        "email": "arnavbutala@gmail.com",
        "available_days": ["Tuesday", "Saturday", "Friday"]
      },
      {
        "name": "Piya Badal",
        "city": "Pune",
        "specialization": "Surgeon",
        "hospital": "Jayaraman-Gill",
        "age": 57,
        "rating": 3.0,
        "email": "piyabadal@gmail.com",
        "available_days": ["Tuesday", "Saturday"]
      },
      {
        "name": "Navya Sharaf",
        "city": "Pune",
        "specialization": "Neurologist",
        "hospital": "Joshi PLC",
        "age": 33,
        "rating": 4.2,
        "email": "navyasharaf@gmail.com",
        "available_days": [
          "Friday",
          "Monday",
          "Sunday",
          "Thursday",
          "Tuesday",
          "Wednesday"
        ]
      },
      {
        "name": "Aarna Boase",
        "city": "Pune",
        "specialization": "Oncologist",
        "hospital": "Madan and Sons",
        "age": 51,
        "rating": 3.4,
        "email": "aarnaboase@gmail.com",
        "available_days": ["Sunday", "Tuesday", "Thursday"]
      },
      {
        "name": "Neysa Barman",
        "city": "Pune",
        "specialization": "Neurologist",
        "hospital": "Arya LLC",
        "age": 44,
        "rating": 4.3,
        "email": "neysabarman@gmail.com",
        "available_days": ["Monday", "Thursday", "Tuesday"]
      },
      {
        "name": "Yakshit Maharaj",
        "city": "Pune",
        "specialization": "Endocrinologist",
        "hospital": "Swaminathan, Samra and Sarkar",
        "age": 29,
        "rating": 4.2,
        "email": "yakshitmaharaj@gmail.com",
        "available_days": [
          "Monday",
          "Friday",
          "Sunday",
          "Tuesday",
          "Thursday",
          "Saturday",
          "Wednesday"
        ]
      },
      {
        "name": "Nitya Khalsa",
        "city": "Pune",
        "specialization": "Surgeon",
        "hospital": "Talwar, Keer and Bail",
        "age": 42,
        "rating": 4.4,
        "email": "nityakhalsa@gmail.com",
        "available_days": ["Wednesday", "Saturday", "Monday", "Sunday"]
      },
      {
        "name": "Uthkarsh Samra",
        "city": "Pune",
        "specialization": "Psychiatrist",
        "hospital": "Bhatt-Vora",
        "age": 45,
        "rating": 4.6,
        "email": "uthkarshsamra@gmail.com",
        "available_days": [
          "Friday",
          "Monday",
          "Thursday",
          "Tuesday",
          "Saturday",
          "Wednesday",
          "Sunday"
        ]
      },
      {
        "name": "Sana Bava",
        "city": "Pune",
        "specialization": "Cardiologist",
        "hospital": "Toor, Chaudhuri and Chanda",
        "age": 48,
        "rating": 3.4,
        "email": "sanabava@gmail.com",
        "available_days": [
          "Friday",
          "Wednesday",
          "Sunday",
          "Monday",
          "Saturday",
          "Thursday",
          "Tuesday"
        ]
      },
      {
        "name": "Yakshit Dara",
        "city": "Pune",
        "specialization": "Oncologist",
        "hospital": "Dhar and Sons",
        "age": 33,
        "rating": 3.3,
        "email": "yakshitdara@gmail.com",
        "available_days": [
          "Saturday",
          "Thursday",
          "Sunday",
          "Tuesday",
          "Friday",
          "Monday"
        ]
      },
      {
        "name": "Shalv Balan",
        "city": "Pune",
        "specialization": "Pediatrician",
        "hospital": "Butala-Golla",
        "age": 31,
        "rating": 4.3,
        "email": "shalvbalan@gmail.com",
        "available_days": ["Monday", "Friday", "Thursday", "Wednesday"]
      },
      {
        "name": "Farhan Ghose",
        "city": "Pune",
        "specialization": "Cardiologist",
        "hospital": "Kohli-Sangha",
        "age": 53,
        "rating": 3.2,
        "email": "farhanghose@gmail.com",
        "available_days": ["Sunday", "Wednesday"]
      },
      
      {
        "name": "Anahita Mammen",
        "city": "Surat",
        "specialization": "Gynecologist",
        "hospital": "Bhattacharyya, Maharaj and Wagle",
        "age": 33,
        "rating": 4.5,
        "email": "anahitamammen@gmail.com",
        "available_days": [
          "Monday",
          "Tuesday",
          "Sunday",
          "Friday",
          "Thursday",
          "Saturday"
        ]
      },
      {
        "name": "Lakshay Borah",
        "city": "Surat",
        "specialization": "Endocrinologist",
        "hospital": "Kar-Goda",
        "age": 67,
        "rating": 3.3,
        "email": "lakshayborah@gmail.com",
        "available_days": ["Tuesday", "Wednesday", "Saturday"]
      },
      {
        "name": "Bhavin Saran",
        "city": "Surat",
        "specialization": "Psychiatrist",
        "hospital": "Cheema, Kumer and Ramachandran",
        "age": 44,
        "rating": 4.2,
        "email": "bhavinsaran@gmail.com",
        "available_days": [
          "Sunday",
          "Wednesday",
          "Tuesday",
          "Saturday",
          "Monday",
          "Friday",
          "Thursday"
        ]
      },
      {
        "name": "Dhruv Babu",
        "city": "Surat",
        "specialization": "Psychiatrist",
        "hospital": "Rajan LLC",
        "age": 34,
        "rating": 4.9,
        "email": "dhruvbabu@gmail.com",
        "available_days": ["Wednesday", "Saturday", "Thursday", "Tuesday"]
      },
      {
        "name": "Dhanush Setty",
        "city": "Surat",
        "specialization": "Endocrinologist",
        "hospital": "Chaudhari PLC",
        "age": 65,
        "rating": 3.6,
        "email": "dhanushsetty@gmail.com",
        "available_days": [
          "Saturday",
          "Thursday",
          "Wednesday",
          "Friday",
          "Sunday",
          "Tuesday"
        ]
      },
      {
        "name": "Amani Bajwa",
        "city": "Surat",
        "specialization": "Neurologist",
        "hospital": "Majumdar, Majumdar and Bansal",
        "age": 58,
        "rating": 4.8,
        "email": "amanibajwa@gmail.com",
        "available_days": [
          "Saturday",
          "Wednesday",
          "Monday",
          "Friday",
          "Sunday"
        ]
      },
      {
        "name": "Nirvi Khatri",
        "city": "Surat",
        "specialization": "Surgeon",
        "hospital": "Mahajan, Bajaj and Handa",
        "age": 51,
        "rating": 4.3,
        "email": "nirvikhatri@gmail.com",
        "available_days": ["Tuesday", "Sunday", "Monday"]
      },
      {
        "name": "Sara Tella",
        "city": "Surat",
        "specialization": "Gynecologist",
        "hospital": "Vig, Swamy and Agarwal",
        "age": 64,
        "rating": 4.9,
        "email": "saratella@gmail.com",
        "available_days": ["Thursday", "Wednesday", "Saturday", "Sunday"]
      },
      {
        "name": "Amani Dave",
        "city": "Surat",
        "specialization": "Gynecologist",
        "hospital": "Gaba Inc",
        "age": 62,
        "rating": 3.3,
        "email": "amanidave@gmail.com",
        "available_days": [
          "Friday",
          "Thursday",
          "Sunday",
          "Wednesday",
          "Tuesday"
        ]
      },
      {
        "name": "Vidur Kakar",
        "city": "Surat",
        "specialization": "Cardiologist",
        "hospital": "De and Sons",
        "age": 67,
        "rating": 3.3,
        "email": "vidurkakar@gmail.com",
        "available_days": ["Monday", "Tuesday"]
      },
      {
        "name": "Saira Cherian",
        "city": "Surat",
        "specialization": "Gynecologist",
        "hospital": "Bedi, Borde and Trivedi",
        "age": 70,
        "rating": 4.8,
        "email": "sairacherian@gmail.com",
        "available_days": ["Thursday", "Monday", "Sunday"]
      },
      {
        "name": "Anya Chauhan",
        "city": "Surat",
        "specialization": "Endocrinologist",
        "hospital": "Ratti-Bhatnagar",
        "age": 27,
        "rating": 4.1,
        "email": "anyachauhan@gmail.com",
        "available_days": ["Friday", "Monday", "Saturday", "Thursday"]
      },
      {
        "name": "Prisha Dave",
        "city": "Surat",
        "specialization": "Surgeon",
        "hospital": "Sibal-Chaudhuri",
        "age": 63,
        "rating": 4.7,
        "email": "prishadave@gmail.com",
        "available_days": ["Friday", "Sunday", "Tuesday", "Saturday"]
      },
      {
        "name": "Baiju Upadhyay",
        "city": "Surat",
        "specialization": "Gynecologist",
        "hospital": "Dutta-Singh",
        "age": 41,
        "rating": 3.9,
        "email": "baijuupadhyay@gmail.com",
        "available_days": ["Thursday", "Sunday", "Friday", "Tuesday"]
      },
      {
        "name": "Divij Balasubramanian",
        "city": "Surat",
        "specialization": "Neurologist",
        "hospital": "Lata-Jha",
        "age": 59,
        "rating": 3.5,
        "email": "divijbalasubramanian@gmail.com",
        "available_days": ["Sunday", "Tuesday", "Thursday", "Monday"]
      }












      
    ];

    for (var i = 0; i < li.length; i++) {
      await add_doctor(li[i]);
    }
  }
}
