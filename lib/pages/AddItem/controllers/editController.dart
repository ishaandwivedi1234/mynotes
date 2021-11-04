import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:mynotes/models/note.dart';
import 'package:mynotes/services/firebase_service.dart';
import 'package:mynotes/services/local_storage.dart';

class EditController extends GetxController {
  RxString title = ''.obs;
  RxString desc = ''.obs;
  RxString tag = ''.obs;

  // EditController(Note note) {
  //   this.title.value = note.title;
  //   this.desc.value = note.desc;
  //   this.tag.value = note.tag;
  // }

  void editItem(Note oldNote) async {
    if (title.value == '')
      Get.snackbar('Incomplete Form', 'Please add title');
    else if (desc.value == '')
      Get.snackbar('Incomplete Form', 'Please add description');
    else if (tag.value == '')
      Get.snackbar('Invalid Tag', 'Please select a tag');
    else {
      FirebaseService firebaseService = new FirebaseService();
      LocalStorage localStorage = new LocalStorage();
      Map<String, dynamic> data = await localStorage.getSavedUser();
      if (data['user'] == null) {
        // logout
        return;
      }
      Note newNote =
          new Note(title: title.value, desc: desc.value, tag: tag.value);
      bool res =
          await firebaseService.editNoteInFirebase(data['user'].email, newNote,oldNote);

      if (!res)
        Get.snackbar('Oops ! ', 'faild to save your note, please try again');
      else
        Get.back();
    }
  }
}
