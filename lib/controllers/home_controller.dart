import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinsy_vpn/models/vpn_configuration_model.dart';

import '../App Preferences/app_preferences.dart';
import '../models/vpn_info_model.dart';
import '../vpn engine/vpn_engine.dart';

class HomeController extends GetxController {
  final Rx<VpnInfoModel> vpnInfo = AppPreferences.vpnInfoModelObject.obs;
  final vpnConnectionState = VpnEngine.vpnDisConnectedNow.obs;
  void connectionToVpn() async {
    if (vpnInfo.value.base640VpnConfigurationData.isEmpty) {
      Get.snackbar("Country / Location", "pls select Country / Location first");
    }

    /// disconnection
    if (vpnConnectionState.value == VpnEngine.vpnDisConnectedNow) {
      final dataConfigVpn =
          Base64Decoder().convert(vpnInfo.value.base640VpnConfigurationData);
      final configuration = Utf8Decoder().convert(dataConfigVpn);
      final vpnConfiguration = VpnConfigurationModel(
        userName: "vpn",
        password: "vpn",
        countryName: vpnInfo.value.countryLongName,
        config: configuration,
      );
      await VpnEngine.startVpnNow(vpnConfiguration);
    }
  }
  Color get getRoundVpnButtonColor {
    switch (vpnConnectionState.value){
      case VpnEngine.vpnDisConnectedNow:
        return Colors.redAccent;
      case VpnEngine.vpnConnectedNow:
        return Colors.green;
      default:
        return Colors.orangeAccent;
    }
  }
  String get getRoundVpnButtonText {
    switch (vpnConnectionState.value){
      case VpnEngine.vpnDisConnectedNow:
        return "Lets connect";
      case VpnEngine.vpnConnectedNow:
        return "Disconnect";
      default:
        return "Connecting";
    }
  }

}
