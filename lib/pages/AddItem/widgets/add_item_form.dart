import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/pages/AddItem/controllers/saveItemController.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/utility/util.dart';

class AddItemForm extends StatelessWidget {
  AddItemForm({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();
  SaveItemController saveItemController = Get.find<SaveItemController>();
  TextEditingController _titleController = new TextEditingController();
  TextEditingController _descriptinController = new TextEditingController();
  String tag = '';
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: h(context) * 0.4,
      child: Form(
        key: _formKey,
        child: Obx(() {
          Color fg = Colors.white;
          Color txtColor = Colors.black;
          Color hintColor = Colors.grey.shade600;

          if (homeController.isDark.value) {
            fg = darkFg2;
            txtColor = Colors.white;
            hintColor = Colors.grey.shade400;
          }
          return Column(
            children: [
              Neumorphic(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                style: NeumorphicStyle(
                  color: fg,
                  shadowDarkColor: fg,
                  shadowLightColor: fg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Text(
                        'Note Title',
                        style: GoogleFonts.getFont('Open Sans',
                            fontSize: 18,
                            color: txtColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    TextFormField(
                      controller: _titleController,
                      cursorColor: cursorColor,
                      cursorWidth: 0.8,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText: '# Take A Small Nap',
                        hintStyle: GoogleFonts.getFont('Open Sans',
                            color: hintColor, fontSize: 20),
                        border: InputBorder.none,
                      ),
                    )
                  ],
                ),
              ),
              Neumorphic(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                style: NeumorphicStyle(
                  color: fg,
                  shadowDarkColor: fg,
                  shadowLightColor: fg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Text(
                        'Note Description',
                        style: GoogleFonts.getFont('Open Sans',
                            fontSize: 18,
                            color: txtColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    TextFormField(
                      controller: _descriptinController,
                      cursorColor: cursorColor,
                      cursorWidth: 0.8,
                      maxLines: 10,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10),
                        hintText:
                            '# What to describe about a nap, Maybe an hour long nap would be fine .',
                        hintStyle: GoogleFonts.getFont('Open Sans',
                            color: hintColor, fontSize: 20),
                        border: InputBorder.none,
                      ),
                    )
                  ],
                ),
              ),
              Neumorphic(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                style: NeumorphicStyle(
                  color: fg,
                  shadowDarkColor: fg,
                  shadowLightColor: fg,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: EdgeInsets.only(left: 10, top: 10, bottom: 10),
                      child: Text(
                        'Select Tag',
                        style: GoogleFonts.getFont('Open Sans',
                            fontSize: 18,
                            color: txtColor,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                    Container(
                      width: w(context),
                      child: Row(
                        children: [
                          CustomRadioButton(
                            autoWidth: true,
                            enableShape: true,
                            elevation: 2,
                            absoluteZeroSpacing: false,
                            unSelectedColor: Theme.of(context).canvasColor,
                            buttonLables: [
                              'Note',
                              'Task',
                              'Reminder',
                            ],
                            buttonValues: [
                              "NOTE",
                              "TASK",
                              "REMINDER",
                            ],
                            buttonTextStyle: ButtonTextStyle(
                                selectedColor: Colors.white,
                                unSelectedColor: Colors.black,
                                textStyle: TextStyle(fontSize: 16)),
                            radioButtonValue: (value) {
                              saveItemController.tag.value = value.toString();
                            },
                            selectedColor: Theme.of(context).primaryColor,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Obx(() {
                Color btnColor = Colors.green;
                if (homeController.isDark.value) btnColor = Colors.green;
                return Container(
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  height: 50,
                  child: NeumorphicButton(
                      style: NeumorphicStyle(
                          color: btnColor,
                          shadowDarkColor: btnColor,
                          shadowLightColor: btnColor),
                      onPressed: () {
                        saveItemController.title.value = _titleController.text;
                        saveItemController.desc.value =
                            _descriptinController.text;

                        saveItemController.saveItem();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          txt('Continue', c: Colors.white, size: 15.0),
                          SizedBox(
                            width: 3,
                          ),
                          Icon(
                            Icons.arrow_right_alt_rounded,
                            color: Colors.white,
                            size: 30,
                          )
                        ],
                      )),
                );
              })
            ],
          );
        }),
      ),
    );
  }
}
