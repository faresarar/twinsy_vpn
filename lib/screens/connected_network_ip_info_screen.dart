import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinsy_vpn/services/api_vpn_gate.dart';
import 'package:twinsy_vpn/widgets/custom_refresh_button.dart';

import '../models/ip_info_model.dart';

class ConnectedNetworkIpInfoScreen extends StatelessWidget {
  const ConnectedNetworkIpInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ipInformation = IpInfoModel.fromJson({}).obs;
    ApiVpnGate.retrieveIpDetails(ipInformation: ipInformation);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Connect Network Ip Information"),
      ),
      floatingActionButton: CustomRefreshButton(
        function: () {
          ApiVpnGate.retrieveIpDetails(ipInformation: ipInformation);
        },
      ),
      body: Obx(
        () => ListView(
          physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(3),
          children: [],
        ),
      ),
    );
  }
}
