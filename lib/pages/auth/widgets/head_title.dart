import 'package:flutter/material.dart';
import 'package:mynotes/pages/utility/util.dart';
class HeadTitle extends StatelessWidget {
  
  const HeadTitle({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: txt("Hello, Guest 👋 ",font: 'Open Sans',size: 20.0),  
             
        ),
        SizedBox(height: 5,),
        Container(
          child: txt("Start noting your works now",font: 'Open Sans',size: 15.0),  
             
        ),
        
      ],
    );
  }
}