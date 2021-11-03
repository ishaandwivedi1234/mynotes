import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/utility/util.dart';

class Title extends StatelessWidget {
   Title({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(20),
      child: Obx(() {
        if (homeController.isDark.value)
          return txt('Your Writings', size: 18.0, c: Colors.white);
        else
          return txt('Your Writings', size: 18.0, c: Colors.black);
      }),
    );
  }
}
