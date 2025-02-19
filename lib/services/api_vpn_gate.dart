import 'dart:convert';

import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:twinsy_vpn/models/ip_info_model.dart';
import '../App Preferences/app_preferences.dart';
import '../models/vpn_info_model.dart';

class ApiVpnGate {
  static Future<List<VpnInfoModel>> retrieveAllAvailableFreeVpnServers() async {
    final List<VpnInfoModel> vpnServerList = [];
    try {
      final responseFromApi =
          await http.get(Uri.parse("https://www.vpngate.net/api/iphone/"));
      final commaSeperatedValueString =
          responseFromApi.body.split("#")[1].replaceAll("*", "");
      List<List<dynamic>> listData =
          CsvToListConverter().convert(commaSeperatedValueString);
      final header = listData[0];
      for (int counter = 1; counter < listData.length - 1; counter++) {
        Map<String, dynamic> jsonData = {};
        for (int innerCounter = 0;
            innerCounter < header.length;
            innerCounter++) {
          jsonData.addAll({
            header[innerCounter].toString(): listData[counter][innerCounter]
          });
        }
        vpnServerList.add(VpnInfoModel.fromJson(jsonData));
      }
    } catch (errorMessage) {
      Get.snackbar(
        "Error Message",
        errorMessage.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      );
    }
    vpnServerList.shuffle();
    if (vpnServerList.isNotEmpty) {
      AppPreferences.vpnList = vpnServerList;
    }
    return vpnServerList;
  }

  static Future<void> retrieveIpDetails({
    required Rx<IpInfoModel> ipInformation,
  }) async {
    try {
      final responseFromApi =
      await http.get(Uri.parse("http://ip-api.com/json/"));
      final dataFromApi = jsonDecode(responseFromApi.body);
      ipInformation.value = IpInfoModel.fromJson(dataFromApi);
    }catch (errorMessage) {
      Get.snackbar(
        "Error Message",
        errorMessage.toString(),
        colorText: Colors.white,
        backgroundColor: Colors.redAccent.withOpacity(0.8),
      );
    }
  }
}
