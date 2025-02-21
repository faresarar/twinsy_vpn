import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:twinsy_vpn/models/network_ip_info_model.dart';
import 'package:twinsy_vpn/services/api_vpn_gate.dart';
import 'package:twinsy_vpn/widgets/custom_refresh_button.dart';
import 'package:twinsy_vpn/widgets/network_ip_info_widget.dart';

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
          children: [
            NetworkIpInfoWidget(
              networkIpInfoModel: NetworkIpInfoModel(
                titleText: "Ip Address",
                subTitleText: ipInformation.value.query,
                iconData: Icon(
                  Icons.my_location,
                  color: Colors.redAccent,
                ),
              ),
            ),
            NetworkIpInfoWidget(
              networkIpInfoModel: NetworkIpInfoModel(
                titleText: "Internet Service Provider",
                subTitleText: ipInformation.value.internetServiceProvider,
                iconData: Icon(
                  Icons.account_tree,
                  color: Colors.deepOrange,
                ),
              ),
            ),
            NetworkIpInfoWidget(
              networkIpInfoModel: NetworkIpInfoModel(
                titleText: "Location",
                subTitleText: ipInformation.value.countryName.isEmpty
                    ? "Retrieving..."
                    : "${ipInformation.value.cityName},${ipInformation.value.regionName},${ipInformation.value.countryName}",
                iconData: Icon(
                  Icons.location_on,
                  color: Colors.green,
                ),
              ),
            ),
            NetworkIpInfoWidget(
              networkIpInfoModel: NetworkIpInfoModel(
                titleText: "Zip Code",
                subTitleText: ipInformation.value.zipCode,
                iconData: Icon(
                  CupertinoIcons.map_pin_ellipse,
                  color: Colors.green,
                ),
              ),
            ),
            NetworkIpInfoWidget(
              networkIpInfoModel: NetworkIpInfoModel(
                titleText: "TimeZone",
                subTitleText: ipInformation.value.timeZone,
                iconData: Icon(
                  CupertinoIcons.time,
                  color: Colors.cyan,
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
