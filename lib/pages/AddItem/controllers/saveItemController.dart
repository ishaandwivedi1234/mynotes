import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';

class SaveItemController extends GetxController {
  RxString title = ''.obs;
  RxString desc = ''.obs;
  RxString tag = ''.obs;

  void saveItem() {
    if (title.value == '') Get.snackbar('Incomplete Form', 'Please add title');
    else if(desc.value == '') Get.snackbar('Incomplete Form', 'Please add description');
    else if(tag.value == '') Get.snackbar('Invalid Tag', 'Please select a tag');
  }
}
