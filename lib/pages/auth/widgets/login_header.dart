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
          image: NetworkImage('https://cdn.dribbble.com/users/1008875/screenshots/5262390/media/24064048c6b2a6965d053aec4d24369b.png?compress=1&resize=1600x1200'))
      )
    );
  }
}