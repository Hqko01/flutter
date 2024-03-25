import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  Future<bool> firstLaunch() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    final runned = storage.getBool("runned");

    if (runned == null) {
      return true;
    }

    return false;
  }

  firstLaunchFunc() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    await storage.setBool("runned", true);
  }
}
