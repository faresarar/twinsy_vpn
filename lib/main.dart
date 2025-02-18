import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'App Preferences/app_preferences.dart';
import 'screens/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: AppPreferences.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 3,
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 3,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

extension AppData on ThemeData {
  static bool isDarkMode = AppPreferences.isDarkMode;
  Color get lightTextColor => isDarkMode ? Colors.white70 : Colors.black54;
  Color get getBottomNavigationColor => isDarkMode ? Colors.white12 : Colors.redAccent;
}
