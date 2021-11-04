import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/pages/utility/util.dart';

class EditHeader extends StatelessWidget {
  const EditHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(top: 0),
            height: h(context) * 0.18,
            width: w(context),
            decoration: BoxDecoration(
                color: darkFg2,
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        'assets/addHead.jpg'))),
            child: Column(
              children: [],
            ),
          ),
          Container(
            height: h(context) * 0.18,
            width: w(context),
            // margin: EdgeInsets.only(top: 20),
    
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Colors.black.withOpacity(0.8),
              Colors.grey.withOpacity(0.7)
            ])),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                           mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 10),
                          padding: EdgeInsets.only(top: 20),
                          child: GestureDetector(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                              ))),
    
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              padding: EdgeInsets.only(top: 20),
                              child: txt('Edit Note Item',c: Colors.white,size: 18.0),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10,top: 3),
                              child: txt('Describe your work here and let us remember',c: Colors.white,size: 13.0),
                            ),
                          ],
                        )
                    ],
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
