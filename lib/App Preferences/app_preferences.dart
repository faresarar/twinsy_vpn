import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import '../models/vpn_info_model.dart';

class AppPreferences {
  static late Box boxOfData;
  static Future<void> initHive() async {
    await Hive.initFlutter();
    boxOfData = await Hive.openBox("data");
  }

  /// saving user choice about theme selection
  static bool get isDarkMode => boxOfData.get("isDarkMode") ?? false;
  static set isDarkMode(bool value) => boxOfData.put("isDarkMode", value);

  /// for saving single selected vpn details

  static VpnInfoModel get vpnInfoModelObject => VpnInfoModel.fromJson(
        boxOfData.get("vpn" ?? "{}"),
      );
  static set vpnInfoModelObject(VpnInfoModel value) =>
      boxOfData.put("vpn", jsonEncode(value));
  static List<VpnInfoModel> get vpnList {
    List<VpnInfoModel> tempVpnList = [];
    final dataVpn = jsonDecode(boxOfData.get("vpnList" ?? "[]"));
    for (var data in dataVpn) {
      tempVpnList.add(VpnInfoModel.fromJson(dataVpn));
    }
    return tempVpnList;
  }

  static set vpnList(List<VpnInfoModel> valueList) =>
      boxOfData.put("vpnList", jsonEncode(valueList));
}
