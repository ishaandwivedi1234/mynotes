import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mynotes/models/note.dart';
import 'package:mynotes/pages/Home/controllers/homeController.dart';
import 'package:mynotes/pages/utility/util.dart';
import 'package:mynotes/services/firebase_service.dart';

class NoteItems extends StatelessWidget {
  NoteItems({Key? key}) : super(key: key);
  HomeController homeController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 50),
      child: StreamBuilder<Object>(
          stream: FirebaseFirestore.instance
              .collection('notes')
              .where('email', isEqualTo: GetStorage().read('email'))
              .snapshots(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData)
              return txt('');
            else if (snapshot.hasError)
              return txt('');
            else if (snapshot.data.docs.length == 0) {
              return Container(
                height: h(context) * 0.5,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Image.asset(
                        'assets/noNote2.png',
                        width: w(context) * 0.7,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      dynamicTxt('Opps ! Seems you are not organized')
                    ],
                  ),
                ),
              );
            } else
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.docs.length,
                  padding: EdgeInsets.only(top: 30),
                  itemBuilder: (context, index) {
                    Note note = new Note(
                        title: snapshot.data.docs[index]['title'],
                        desc: snapshot.data.docs[index]['desc'],
                        tag: snapshot.data.docs[index]['tag']);

                    return Obx(() {
                      Color c = Colors.white;
                      Color shadowColor = Colors.grey.shade300;
                      Color nightShadowColor = darkFg2;
                      if (homeController.isDark.value) {
                        c = darkFg2;
                        shadowColor = nightShadowColor;
                      }
                      return Neumorphic(
                        margin:
                            EdgeInsets.only(bottom: 10, left: 20, right: 20),
                        style: NeumorphicStyle(
                            color: c,
                            shadowDarkColor: shadowColor,
                            shadowLightColor: nightShadowColor.withOpacity(0.2)),
                        child: Container(
                          margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              // color: Colors.grey.shade100,

                              ),
                          child: ListTile(
                              title: Obx(() {
                                if (homeController.isDark.value)
                                  return Text('${note.title}',
                                      style: GoogleFonts.getFont('Open Sans',
                                          fontSize: 18,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600));
                                else
                                  return Text(
                                    '${note.title}',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                  );
                              }),
                              leading: Icon(Icons.note,
                                  color: note.tag == 'NOTE'
                                      ? Colors.amber
                                      : note.tag == 'TASK'
                                          ? Colors.green
                                          : Colors.red),
                              subtitle: Container(
                                margin: EdgeInsets.only(top: 6),
                                child: Obx(() {
                                  if (homeController.isDark.value)
                                    return Text(
                                      '${note.desc}',
                                      style: GoogleFonts.getFont('Open Sans',
                                          color: Colors.grey.shade50,
                                          fontSize: 16),
                                    );
                                  else
                                    return txt('${note.desc}',
                                        c: Colors.grey.shade600);
                                }),
                              ),
                              trailing: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      homeController.deleteNote(note);
                                    },
                                    child: Icon(Icons.delete_outline_rounded,
                                        color: Colors.grey.shade300),
                                  ),
                                  SizedBox(height:5),
                                  GestureDetector(
                                    onTap: () {
                                      homeController.editNote(note);
                                    },
                                    child: Icon(Icons.edit,
                                        color: Colors.grey.shade300),
                                  ),
                                ],
                              )),
                        ),
                      );
                    });
                  });
          }),
    );
  }
}
