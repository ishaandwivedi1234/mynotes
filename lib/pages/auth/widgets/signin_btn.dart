import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mynotes/pages/auth/controllers/authController.dart';
import 'package:mynotes/pages/utility/util.dart';

class GoogleSignInButton extends StatelessWidget {
  AuthController authController = new AuthController();
  GoogleSignInButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {

     
      return Container(
        
        child: Obx(() {
            return AnimatedContainer(
              duration: Duration(milliseconds: 150),
              curve: Curves.linear,
              width: authController.isLoading.value ? 30 : w(context) * 0.5,
              height: authController.isLoading.value ? 30 : 40,
              child: authController.isLoading.value ? 
              Container(
                height: 30,
                width: 30,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                )):
               Container(
                 
                 child: ElevatedButton(
                    onPressed: () {
                      authController.SignInUsingGoogle();
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        txt('Get Started', c: Colors.white),
                        Icon(Icons.arrow_forward_outlined)
                      ],
                    )),
               ),
            );
          }
        ),
      );
    
  }
}
