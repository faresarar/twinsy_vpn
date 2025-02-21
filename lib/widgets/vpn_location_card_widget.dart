import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinsy_vpn/main.dart';

import '../controllers/home_controller.dart';
import '../models/vpn_info_model.dart';

class VpnLocationCardWidget extends StatelessWidget {
  const VpnLocationCardWidget({
    super.key,
    required this.vpnInfoModel,
  });
  final VpnInfoModel vpnInfoModel;
  String formatSpeedByte({required int speedBytes, required int decimals}) {
    if (speedBytes <= 0) {
      return "0 B";
    }
    const suffixesTitle = ["Bps", "Kbps", "Mbps", "Gbps", "Tbps"];
    var speedTitleIndex = (log(speedBytes) / log(1024)).floor();
    return "${(speedBytes / pow(1024, speedTitleIndex)).toStringAsFixed(decimals)} ${suffixesTitle[speedTitleIndex]}";
  }

  @override
  Widget build(BuildContext context) {
    final homeController = Get.find<HomeController>();
    final sizeScreen = MediaQuery.sizeOf(context);
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: sizeScreen.height * 0.01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(0.5),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(16),
            ),
            child: Image.asset(
              "assets/images/countryFlags/${vpnInfoModel.countryShortName.toLowerCase()}.png",
              height: 40,
              width: sizeScreen.width * 0.15,
              fit: BoxFit.cover,
            ),
          ),
          title: Text(vpnInfoModel.countryLongName),
          subtitle: Row(
            spacing: 4,
            children: [
              Icon(
                Icons.shutter_speed,
                color: Colors.redAccent,
                size: 20,
              ),
              Text(
                formatSpeedByte(
                  decimals: 2,
                  speedBytes: vpnInfoModel.speed,
                ),
                style: TextStyle(fontSize: 13),
              ),
            ],
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              Text(
                vpnInfoModel.vpnSessionsNumber.toString(),
                style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).lightTextColor),
              ),
              Icon(Icons.group),
            ],
          ),
        ),
      ),
    );
  }
}
