import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/pages/AddItem/controllers/saveItemController.dart';
import 'package:mynotes/pages/AddItem/widgets/add_item_form.dart';
import 'package:mynotes/pages/AddItem/widgets/header.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/utility/util.dart';

class AddItem extends StatelessWidget {
  AddItem({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();
  SaveItemController saveItemController = Get.put(SaveItemController());
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Color c = Colors.grey.shade50;
      if (homeController.isDark.value) c = darkBg;
      return Scaffold(
        backgroundColor: c,
        body: Column(
          children: [
            Header(),
            SizedBox(
              height: 30,
            ),
            AddItemForm()
          ],
        ),
      );
    });
  }
}
