import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../App Preferences/app_preferences.dart';
import '../controllers/home_controller.dart';
import '../models/vpn_status_model.dart';
import '../vpn engine/vpn_engine.dart';
import '../widgets/custom_button_widget.dart';
import '../widgets/custom_rounded_widget.dart';
import '../widgets/location_selection.dart';
import 'connected_network_ip_info_screen.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  static final homeController = Get.put(HomeController());
  final vpnInfo = homeController.vpnInfo.value;
  @override
  Widget build(BuildContext context) {
    VpnEngine.snapshotVpnStage().listen((event) {
      homeController.vpnConnectionState.value = event;
    });
    return Scaffold(
      bottomNavigationBar: LocationSelection(),
      appBar: AppBar(
        title: Text("Free Vpn"),
        leading: IconButton(
          onPressed: () {
            Get.to(() => ConnectedNetworkIpInfoScreen());
          },
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
                titleText: vpnInfo.countryLongName.isEmpty
                    ? "Location"
                    : vpnInfo.countryLongName,
                subTitleText: "free",
                color: Colors.red,
                iconData:
                    vpnInfo.countryLongName.isEmpty ? Icons.flag_circle : null,
                image: vpnInfo.countryLongName.isEmpty
                    ? null
                    : Image.asset(
                        'assets/images/${vpnInfo.countryShortName.toLowerCase()}.png'), // Replace with your image path
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
          Obx(
            () => CustomButtonWidget(
              color: homeController.getRoundVpnButtonColor.withOpacity(0.1),
              color2: homeController.getRoundVpnButtonColor.withOpacity(0.3),
              color3: homeController.getRoundVpnButtonColor,
              statusText: homeController.getRoundVpnButtonText,
              function: homeController.connectionToVpn,
              statusConnectionText: homeController.vpnConnectionState.value ==
                      VpnEngine.vpnDisConnectedNow
                  ? "Not Connected"
                  : homeController.vpnConnectionState
                      .replaceAll("_", "".toUpperCase()),
              initTimerNow: homeController.vpnConnectionState.value ==
                  VpnEngine.vpnConnectedNow,
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
