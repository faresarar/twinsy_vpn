import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinsy_vpn/widgets/custom_rounded_widget.dart';
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
              AppPreferences.isDarkMode = !AppPreferences.isDarkMode;
            },
            icon: Icon(Icons.dark_mode),
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRoundedWidget(
                titleText: "Location",
                subTitleText: "free",
                color: Colors.red,
                iconData: Icons.flag_circle,
              ),
              CustomRoundedWidget(
                titleText: "60 ms",
                subTitleText: "ping",
                color: Colors.grey,
                iconData: Icons.graphic_eq,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomRoundedWidget(
                titleText: "0 kbps",
                subTitleText: "Download",
                color: Colors.green,
                iconData: Icons.arrow_circle_up_outlined,
              ),
              CustomRoundedWidget(
                titleText: "0 kbps",
                subTitleText: "Upload",
                color: Colors.purpleAccent,
                iconData: Icons.arrow_circle_down_outlined,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
