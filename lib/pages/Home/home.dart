import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/Home/widgets/home_header.dart';
import 'package:mynotes/pages/Home/widgets/note_items.dart';
import 'package:mynotes/pages/utility/util.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  HomeController homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Color c = Colors.grey.shade50;
      if (homeController.isDark.value) c = darkBg;
      return Scaffold(
          backgroundColor: c,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              homeController.goToAddPage();
            },
            backgroundColor: darkFg2,
            child: Icon(Icons.add),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [HomeHeader(), NoteItems()],
          ));
    });
  }
}
