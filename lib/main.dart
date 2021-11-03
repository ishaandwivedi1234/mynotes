import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mynotes/pages/Home/home.dart';
import 'package:mynotes/pages/auth/login.dart';
import 'package:mynotes/pages/splash/splash.dart';
import 'package:mynotes/pages/utility/util.dart';
import 'package:mynotes/services/local_storage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await GetStorage.init();

  runApp(GetMaterialApp(
    theme: ThemeData(primaryColor: darkFg2),
    debugShowCheckedModeBanner: false,
    home: MyNotes(),
  ));
}

class MyNotes extends StatelessWidget {
  const MyNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LocalStorage localStorage = new LocalStorage();
    Timer(Duration(seconds: 1), () async {
      if (await localStorage.isLogged()) {
        Get.off(()=>Home());
      }
       else Get.off(()=>Login());

    });
    return Splash();
  }
}
