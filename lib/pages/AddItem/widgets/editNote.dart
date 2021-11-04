import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/models/note.dart';
import 'package:mynotes/pages/AddItem/controllers/editController.dart';
import 'package:mynotes/pages/AddItem/controllers/saveItemController.dart';
import 'package:mynotes/pages/AddItem/widgets/add_item_form.dart';
import 'package:mynotes/pages/AddItem/widgets/editForm.dart';
import 'package:mynotes/pages/AddItem/widgets/editHeader.dart';
import 'package:mynotes/pages/AddItem/widgets/header.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/utility/util.dart';

class EditNote extends StatelessWidget {
  Note note;
  EditNote({Key? key, required this.note}) : super(key: key) {
    print(note.desc);
  }
  HomeController homeController = Get.find<HomeController>();
  EditController editController = Get.put(EditController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      Color c = Colors.grey.shade50;
      if (homeController.isDark.value) c = darkBg;
      return Scaffold(
        backgroundColor: c,
        body: SingleChildScrollView(
          child: Column(
            children: [
              EditHeader(),
              SizedBox(
                height: 30,
              ),
              EditItemForm(note: note)
            ],
          ),
        ),
      );
    });
  }
}
