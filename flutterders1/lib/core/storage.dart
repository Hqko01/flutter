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

  setConfig({String? language, bool? darkMode}) async {
    final SharedPreferences storage = await SharedPreferences.getInstance();

    if (language != null) {
      await storage.setString("language", language);
    }

    if (darkMode != null) {
      await storage.setBool("darkMode", darkMode);
    }
  }

  getConfig() async {
    final SharedPreferences storage = await SharedPreferences.getInstance();
    return {
      "darkmode": storage.getBool("darkMode"),
      "language": storage.getString("language"),
    };
  }
}
