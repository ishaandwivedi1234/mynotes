import 'package:flutter/material.dart';
import 'package:mynotes/pages/utility/util.dart'; 
class HomeAppbar extends StatelessWidget {
  const HomeAppbar({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: txt('My Notes'),
    );
   
  }
}