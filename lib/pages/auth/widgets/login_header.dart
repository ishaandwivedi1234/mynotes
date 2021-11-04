import 'package:flutter/material.dart';
import 'package:mynotes/pages/utility/util.dart';
class LoginHeader extends StatelessWidget {
  const LoginHeader({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: h(context) * 0.3,
      width: w(context),
      margin: EdgeInsets.only(top: h(context)*0.2),
      decoration:BoxDecoration(
        
        image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/loginImg.png'))
      )
    );
  }
}