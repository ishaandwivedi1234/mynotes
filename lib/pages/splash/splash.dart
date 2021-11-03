import 'package:flutter/material.dart';
import 'package:mynotes/pages/utility/util.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [

        txt('My Notes')
      ],),
    );
  }
}
