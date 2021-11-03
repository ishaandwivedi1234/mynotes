import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/pages/auth/controllers/authController.dart';
import 'package:mynotes/pages/auth/widgets/head_title.dart';
import 'package:mynotes/pages/auth/widgets/login_header.dart';
import 'package:mynotes/pages/auth/widgets/signin_btn.dart';

class Login extends StatelessWidget {
  AuthController authController = Get.put(AuthController());
  Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LoginHeader(),
            HeadTitle(),
            SizedBox(
              height: 20,
            ),
            GoogleSignInButton()
          ],
        ),
      ),
    );
  }
}
