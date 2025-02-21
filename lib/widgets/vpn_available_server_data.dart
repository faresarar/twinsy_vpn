import 'package:flutter/material.dart';

import '../controllers/vpn_location_controller.dart';
import 'vpn_location_card_widget.dart';

class VpnAvailableServerData extends StatelessWidget {
  VpnAvailableServerData({super.key, required this.itemCount});
  final int itemCount;
  final vpnLocationController = VpnLocationController();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: itemCount,
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.all(3),
      itemBuilder: (context, index) {
        return VpnLocationCardWidget(
          vpnInfoModel:
              vpnLocationController.freeVpnServersAvailableList[index],
        );
      },
    );
  }
}
