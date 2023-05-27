import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:my_app/authentication/auth_repo.dart';
import 'package:my_app/pages/welcome_page.dart';

import 'data_populating/upload.dart';
import 'firebase_options.dart';

import 'widgets/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((value) => Get.put(AuthenticationRepository()));
    
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Doctor",
      themeMode: ThemeMode.light,
      theme: Mytheme.lightTheme,
      darkTheme: Mytheme.darkTheme,
      debugShowCheckedModeBanner: false,
      home: welcome_page(),
    );
  }
}
