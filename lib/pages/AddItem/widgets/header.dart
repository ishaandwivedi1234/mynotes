import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/pages/utility/util.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 20),
          height: h(context) * 0.15,
          width: w(context),
          decoration: BoxDecoration(
              color: darkFg2,
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://cdn.dribbble.com/users/1294156/screenshots/10038339/media/3dd38b5cd5cfc60d7d678593e98d68ed.jpg?compress=1&resize=1600x1200'))),
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
                            child: txt('Add Item',c: Colors.white,size: 18.0),
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
    );
  }
}
