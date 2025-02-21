import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/vpn_location_controller.dart';
import '../widgets/custom_refresh_button.dart';
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
        floatingActionButton: CustomRefreshButton(
          function: () {
            vpnLocationController.retrieveVpnInformation();
          },
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
