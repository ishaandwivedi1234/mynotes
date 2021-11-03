import 'package:get_storage/get_storage.dart';
import 'package:mynotes/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  void addUserInfoToLocalStorage(Users user) async {
    final box = GetStorage();
    box.write('isLogged', true);
    box.write('email', user.email);
    box.write('name', user.name);
    box.write('photoUrl', user.photoUrl);
    box.write('isDark', false);

  

  }

  Future<bool> isLogged() async {
    final box = GetStorage();
    bool res = false;
    if (box.hasData('isLogged')) res = box.read('isLogged');
    return res;
  }

  Future<Map<String, dynamic>> getSavedUser() async {
    final box = GetStorage();

    Map<String, dynamic> data = {'user': null, 'success': false};
    try {
      String name = box.read('name')!;
      String email = box.read('email')!;
      String photoUrl = box.read('photoUrl')!;
      print('photo url is : ' + photoUrl.toString());
      Users user = new Users(email: email, name: name, photoUrl: photoUrl);
      data['user'] = user;
      data['success'] = true;
    } catch (e) {
      print(e);
    } finally {
      return data;
    }
  }

  void removeLoginData() {
    final box = GetStorage();
    try {
      box.write('isLogged', false);
    } catch (e) {
      print(e);
    }
  }

  void setDarkMode() {
    final box = GetStorage();
    box.write('isDark', true);

  }
  void setLightMode() {
    final box = GetStorage();
    box.write('isDark', false);
    
  }
}
