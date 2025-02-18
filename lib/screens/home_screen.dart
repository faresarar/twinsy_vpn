import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../App Preferences/app_preferences.dart';
import '../widgets/location_selection.dart';
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: LocationSelection(),
      appBar: AppBar(
        title: Text("Free Vpn"),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.perm_device_info),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.changeThemeMode(
                AppPreferences.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
              AppPreferences.isDarkMode =! AppPreferences.isDarkMode;
            },
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
    );
  }
}
