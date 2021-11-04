import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mynotes/models/note.dart';
import 'package:mynotes/models/user.dart';
import 'package:mynotes/pages/AddItem/addItem.dart';
import 'package:mynotes/pages/AddItem/widgets/editNote.dart';
import 'package:mynotes/pages/auth/login.dart';
import 'package:mynotes/services/firebase_service.dart';
import 'package:mynotes/services/local_storage.dart';

class HomeController extends GetxController {
  Rx<Users> user = new Users(
          email: 'test',
          name: 'test',
          photoUrl:
              'https://t4.ftcdn.net/jpg/00/64/67/63/360_F_64676383_LdbmhiNM6Ypzb3FM4PPuFP9rHe7ri8Ju.jpg')
      .obs;

  RxBool isDark = false.obs;
  HomeController() {
    initUser();
  }

  void initUser() async {
    LocalStorage localStorage = new LocalStorage();
    Map<String, dynamic> userData = await localStorage.getSavedUser();

    if (userData['user'] == null) {
      // goto login page from here
      Get.offAll(() => Login());
    }

    this.user.value = userData['user'];

    final box = GetStorage();
    if (box.read('isDark'))
      isDark.value = true;
    else
      isDark.value = false;
  }

  void logout() {
    FirebaseService firebaseService = new FirebaseService();
    LocalStorage localStorage = new LocalStorage();
    firebaseService.signOutFromGoogle();
    localStorage.removeLoginData();
    Get.back();
    Get.offAll(() => Login());
  }

  void setDarkMode() {
    LocalStorage localStorage = new LocalStorage();
    localStorage.setDarkMode();
    isDark.value = true;
    Get.back();
  }

  void setLightMode() {
    LocalStorage localStorage = new LocalStorage();
    localStorage.setLightMode();
    isDark.value = false;
    Get.back();
  }

  void goToAddPage() {
    Get.to(() => AddItem());
  }

  void deleteNote(Note note) async {
    String email = GetStorage().read('email');
    FirebaseService firebaseService = new FirebaseService();
    bool res = await firebaseService.removeNoteFromFirebase(note, email);
    if (!res) print('unable to delete');
  }

  void removeAllNotes() async {
    String email = GetStorage().read('email');
    FirebaseService firebaseService = new FirebaseService();
    bool res = await firebaseService.removeAllNotes(email);
    if (!res) print('unable to delete');
    Get.back();
  }

  void editNote(Note note) {
    String email = GetStorage().read('email');
    Get.to(() => EditNote(note: note));
  }
}
