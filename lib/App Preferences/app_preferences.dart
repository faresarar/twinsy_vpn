import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class AppPreferences {
  static late Box boxOfData;
  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxOfData = await Hive.openBox("data");
  }

  /// saving user choice about theme selection
  static bool get isDarkMode => boxOfData.get("isDarkMode") ?? false;
  static set isDarkMode(bool value) => boxOfData.put("isDarkMode", value);
}
