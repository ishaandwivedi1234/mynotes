import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/utility/util.dart';
import 'package:mynotes/services/firebase_service.dart';

class HomeHeader extends StatelessWidget {
  HomeHeader({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        overflow: Overflow.visible,
        children: [
          Stack(
            children: [
              Container(
                height: h(context) * 0.2,
                width: w(context),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/homeHead.png')
                  )
                )
                
              ),

              Container(
                height: h(context) * 0.2,
                width: w(context),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      darkBg.withOpacity(0.86),
                      darkFg2.withOpacity(0.86)
                    ]
                  )
                ),
                child:SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 20, top: 10),
                            child: Text(
                              'My Notes',
                              style: GoogleFonts.getFont('Open Sans',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 22),
                            ),
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
              )
            ],
          ),
          Positioned(
            bottom: -40,
            left: 0,
            child: Container(
              width: w(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Neumorphic(
                    style: NeumorphicStyle(color: darkFg2),
                    child: Container(
                      height: h(context) * 0.1,
                      width: w(context) / 4 - 10,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: shade1,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: shade1, blurRadius: 10, spreadRadius: .10)
                        // ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'NOTES',
                              style: GoogleFonts.getFont('Open Sans',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),

                            child: StreamBuilder<Object>(
                                stream: FirebaseFirestore.instance
                                    .collection('notes')
                                    .where('email',
                                        isEqualTo: GetStorage().read('email'))
                                    .where('tag', isEqualTo: 'NOTE')
                                    .snapshots(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData)
                                    return Text(
                                      '0',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 19,
                                          color: Colors.amber.shade200,
                                          fontWeight: FontWeight.bold));
                                  return Text(
                                      '${snapshot.data!.docs.length.toString()}',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 19,
                                          color: Colors.amber.shade200,
                                          fontWeight: FontWeight.bold));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 10,),
                  Neumorphic(
                    style: NeumorphicStyle(color: darkFg2),
                    child: Container(
                      height: h(context) * 0.1,
                      width: w(context) * 0.25 - 10,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: shade2,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        // boxShadow: [
                        //   BoxShadow(
                        //       color: shade2, blurRadius: 10, spreadRadius: .10)
                        // ]
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'TASKS',
                              style: GoogleFonts.getFont('Open Sans',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),

                            child: StreamBuilder<Object>(
                                stream: FirebaseFirestore.instance
                                    .collection('notes')
                                    .where('email',
                                        isEqualTo: GetStorage().read('email'))
                                    .where('tag', isEqualTo: 'TASK')
                                    .snapshots(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData)
                                    return Text(
                                      '0',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 19,
                                          color: Colors.amber.shade200,
                                          fontWeight: FontWeight.bold));
                                  return Text(
                                      '${snapshot.data!.docs.length.toString()}',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 19,
                                          color: Colors.green.shade200,
                                          fontWeight: FontWeight.bold));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  // SizedBox(width: 10,),
                  Neumorphic(
                    style: NeumorphicStyle(color: darkFg2),
                    child: Container(
                      height: h(context) * 0.1,
                      width: w(context) / 4 + 20,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        // color: shade3,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: Text(
                              'REMINDERS',
                              style: GoogleFonts.getFont('Open Sans',
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: StreamBuilder<Object>(
                                stream: FirebaseFirestore.instance
                                    .collection('notes')
                                    .where('email',
                                        isEqualTo: GetStorage().read('email'))
                                    .where('tag', isEqualTo: 'REMINDER')
                                    .snapshots(),
                                builder: (context, AsyncSnapshot snapshot) {
                                  if (!snapshot.hasData)
                                    return Text(
                                      '0',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 19,
                                          color: Colors.amber.shade200,
                                          fontWeight: FontWeight.bold));
                                  return Text(
                                    '${snapshot.data!.docs.length.toString()}',
                                    style: GoogleFonts.getFont('Open Sans',
                                        fontSize: 19,
                                        color: Colors.pink.shade200,
                                        fontWeight: FontWeight.bold),
                                  );
                                }),
                          ),
                        ],
                      ),
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
  Color txtColor = Colors.black;
  Color iconColor = Colors.grey.shade600;

  if (isDark) {
    txtColor = Colors.white;
    iconColor = Colors.grey.shade50;
  }

  Get.bottomSheet(Container(
      height: h(context) * 0.25,
      width: w(context),
      decoration: BoxDecoration(color: isDark ? darkBg : Colors.white),
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
                leading: Icon(
                  Icons.dark_mode_outlined,
                  color: iconColor,
                ),
              ),
            ),
            Container(
                child: ListTile(
              onTap: () {
                controller.removeAllNotes();
              },
              title: isDark ? dynamicTxt('Clear All') : dynamicTxt('Clear All'),
              leading: Icon(Icons.cleaning_services, color: iconColor),
            )),
            Container(
              child: ListTile(
                  onTap: () => controller.logout(),
                  title: isDark ? dynamicTxt('Logout') : dynamicTxt('Logout'),
                  leading: Icon(
                    Icons.logout_rounded,
                    color: iconColor,
                  )),
            )
          ],
        ),
      ])));
}
