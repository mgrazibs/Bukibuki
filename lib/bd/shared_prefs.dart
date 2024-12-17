import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  setUser(bool status) async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    instance.setBool('USER', status);
  }

  getUser() async {
    SharedPreferences instance = await SharedPreferences.getInstance();
    bool? userStatus = instance.getBool('USER');

    return userStatus ?? false; // true, false, null
      }
}