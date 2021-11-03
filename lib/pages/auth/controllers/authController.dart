import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

import 'package:get/get.dart';
import 'package:mynotes/models/user.dart';
import 'package:mynotes/pages/Home/home.dart';
import 'package:mynotes/services/firebase_service.dart';
import 'package:mynotes/services/local_storage.dart';

class AuthController extends GetxController {
  var isLoading = false.obs;

  void SignInUsingGoogle() async {
    isLoading.value = true;
    FirebaseService firebaseService = new FirebaseService();
    try {
      User? user = await firebaseService.signInwithGoogle();
      print(user!.displayName);
      if (user == null) throw Exception();
      Users newUser = Users(
          email: user.email!,
          name: user.displayName!,
          photoUrl: user.photoURL!);
      firebaseService.addUserToFirebase(newUser);
      LocalStorage localStorage = new LocalStorage();
      localStorage.addUserInfoToLocalStorage(newUser);

      Get.offAll(() => Home());
    } catch (e) {
      print(e);
    } finally {
      isLoading.value = false;
    }
  }
}
