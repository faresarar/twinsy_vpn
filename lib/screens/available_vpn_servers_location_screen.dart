import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vpn_location_controller.dart';
import '../widgets/loading_ui_widget.dart';
import '../widgets/no_vpn_found_widget.dart';
import '../widgets/vpn_available_server_data.dart';

class AvailableVpnServersLocationScreen extends StatelessWidget {
  AvailableVpnServersLocationScreen({super.key});
  final vpnLocationController = VpnLocationController();
  @override
  Widget build(BuildContext context) {
    if (vpnLocationController.freeVpnServersAvailableList.isEmpty) {
      vpnLocationController.retrieveVpnInformation();
    }
    return Obx(
      () => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text(
            "Vpn Location (${vpnLocationController.freeVpnServersAvailableList.length}",
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 10, right: 10),
          child: FloatingActionButton(
            onPressed: () {
              vpnLocationController.retrieveVpnInformation();
            },
            backgroundColor: Colors.redAccent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(33),
            ),
            child: Icon(
              CupertinoIcons.refresh_circled,
              color: Colors.white70,
            ),
          ),
        ),
        body: vpnLocationController.isLoadingNewLocation.value
            ? LoadingUiWidget()
            : vpnLocationController.freeVpnServersAvailableList.isEmpty
                ? NoVpnFoundWidget()
                : VpnAvailableServerData(
                    itemCount: vpnLocationController
                        .freeVpnServersAvailableList.length,
                  ),
      ),
    );
  }
}
