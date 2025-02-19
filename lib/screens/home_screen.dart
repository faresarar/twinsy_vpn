import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinsy_vpn/models/vpn_status_model.dart';
import 'package:twinsy_vpn/vpn%20engine/vpn_engine.dart';
import 'package:twinsy_vpn/widgets/custom_rounded_widget.dart';
import '../App Preferences/app_preferences.dart';
import '../controllers/home_controller.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/location_selection.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static final homeController = Get.put(HomeController());
  final vpnInfo = homeController.vpnInfo.value;
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
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomRoundedWidget(
                  titleText: vpnInfo.countryLongName.isEmpty
                      ? "Location"
                      : vpnInfo.countryLongName,
                  subTitleText: "free",
                  color: Colors.red,
                  iconData: vpnInfo.countryLongName.isEmpty
                      ? Icons.flag_circle
                      : null,
                  image: vpnInfo.countryLongName.isEmpty
                      ? null // Provide the image if needed when icon is null
                      : Image.asset(
                          'assets/images/${vpnInfo.countryShortName}.png'), // Replace with your image path
                ),
                CustomRoundedWidget(
                  titleText: vpnInfo.countryLongName.isEmpty
                      ? "60 ms"
                      : "${vpnInfo.ping} ms ",
                  subTitleText: "ping",
                  color: Colors.grey,
                  iconData: Icons.graphic_eq,
                ),
              ],
            ),
          ),
          Obx(
            () => CustomButtonWidget(
              color: homeController.getRoundVpnButtonColor.withOpacity(0.1),
              color2: homeController.getRoundVpnButtonColor.withOpacity(0.3),
              color3: homeController.getRoundVpnButtonColor,
              statusText: homeController.getRoundVpnButtonText,
            ),
          ),
          StreamBuilder<VpnStatusModel?>(
            initialData: VpnStatusModel(),
            stream: VpnEngine.snapshotVpnStatus(),
            builder: (context, dataSnapShot) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomRoundedWidget(
                    titleText: dataSnapShot.data!.byteIn ?? "0 kbps",
                    subTitleText: "Download",
                    color: Colors.green,
                    iconData: Icons.arrow_circle_up_outlined,
                  ),
                  CustomRoundedWidget(
                    titleText: dataSnapShot.data!.byteOut ?? "0 kbps",
                    subTitleText: "Upload",
                    color: Colors.purpleAccent,
                    iconData: Icons.arrow_circle_down_outlined,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
