import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/utility/util.dart';
class NoteItems extends StatelessWidget {
   NoteItems({ Key? key }) : super(key: key);
  HomeController homeController = Get.find<HomeController>();


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child:  ListView.builder(
                  shrinkWrap: true,
                  itemCount: 4,
                  padding: EdgeInsets.only(top:30),
                  itemBuilder: (context, index) {
                    return Obx(() {
                      Color c = Colors.white;
                      if (homeController.isDark.value) c = darkFg2;
                      return Neumorphic(
                        margin:
                            EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        style: NeumorphicStyle(
                            color: c, shadowDarkColor: c, shadowLightColor: c),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // color: Colors.grey.shade100,

                              ),
                          child: ListTile(
                              title: Obx(() {
                                if (homeController.isDark.value)
                                  return txt('My Task is To Do Something',
                                      c: Colors.white);
                                else
                                  return txt('My Task is To Do Something',
                                      c: Colors.black);
                              }),
                              leading: Icon(
                                Icons.note,
                                color: index == 2 ? Colors.green : Colors.red,
                              ),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: 6),
                                child: Obx(() {
                                  if (homeController.isDark.value)
                                    return txt('I am describing something',
                                        c: Colors.grey.shade50);
                                  else
                                    return txt('I am describing something',
                                        c: Colors.grey.shade600);
                                }),
                              ),
                              trailing: Icon(Icons.delete_outline_rounded,
                                  color: Colors.grey.shade300)),
                        ),
                      );
                    });
                  }),
    );
  }
}