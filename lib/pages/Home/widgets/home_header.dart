import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/utility/util.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
                overflow: Overflow.visible,
                children: [
                  Container(
                    height: h(context) * 0.2,
                    width: w(context),
                    decoration: BoxDecoration(color: darkFg2),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 20, top: 10),
                                child: txt('My Notes',
                                    c: Colors.white, size: 18.0),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 30),
                                child: Obx(() {
                              
                                  var url = homeController.user.value.photoUrl;
                                  return GestureDetector(
                                    onTap: () {
                                      showSettings(context, homeController);
                                    },
                                    child: CircleAvatar(
                                        radius: 18,
                                        backgroundColor: Colors.blue,
                                        backgroundImage: NetworkImage(url)),
                                  );
                                }),
                              )
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 5),
                            child: Obx(() {
                              String userName = homeController.user.value.name;
                              return txt('Welcome, $userName', c: Colors.white);
                            }),
                          )
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: 0,
                    child: Container(
                      width: w(context),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: h(context) * 0.1,
                            width: w(context) / 4,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: shade1,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: shade1,
                                      blurRadius: 10,
                                      spreadRadius: .10)
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  child: txt('Notes'),
                                ),
                                Container(
                                  child: txt('10', size: 20.0),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(width: 10,),
                          Container(
                            height: h(context) * 0.1,
                            width: w(context) * 0.25,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: shade2,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: shade2,
                                      blurRadius: 10,
                                      spreadRadius: .10)
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  child: txt('Tasks'),
                                ),
                                Container(
                                  child: txt('10', size: 20.0),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(width: 10,),
                          Container(
                            height: h(context) * 0.1,
                            width: w(context) / 4,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color:shade3,
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                boxShadow: [
                                  BoxShadow(
                                      color: shade3,
                                      blurRadius: 10,
                                      spreadRadius: .10)
                                ]),
                            child: Column(
                              children: [
                                Container(
                                  child: txt('Reminders'),
                                ),
                                Container(
                                  child: txt('10', size: 20.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
    );
  }
}


showSettings(context, HomeController controller) {
  final box = GetStorage();
  bool isDark = box.read('isDark');

  Get.bottomSheet(Container(
      height: h(context) * 0.4,
      width: w(context),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(children: [
        ListView(
          shrinkWrap: true,
          children: [
            Container(
              child: ListTile(
                onTap: () {
                  if (isDark)
                    controller.setLightMode();
                  else
                    controller.setDarkMode();
                },
                title:
                    isDark ? dynamicTxt('Light Mode') : dynamicTxt('Dark Mode'),
                leading: Icon(Icons.dark_mode_outlined),
              ),
            ),
            Container(
                child: ListTile(
              title: txt('Clear All'),
              leading: Icon(Icons.cleaning_services),
            )),
            Container(
              child: ListTile(
                title: txt('Dynamic Cards'),
                leading: Icon(Icons.crop_landscape_rounded),
              ),
            ),
            Container(
              child: ListTile(
                title: txt('Change Name'),
                leading: Icon(Icons.edit_outlined),
              ),
            ),
            Container(
              child: ListTile(
                  onTap: () => controller.logout(),
                  title: txt('Logout'),
                  leading: Icon(Icons.logout_rounded)),
            )
          ],
        ),
      ])));
}
