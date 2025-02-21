import 'package:flutter/material.dart';

import '../models/network_ip_info_model.dart';

class NetworkIpInfoWidget extends StatelessWidget {
  const NetworkIpInfoWidget({super.key, required this.networkIpInfoModel});
  final NetworkIpInfoModel networkIpInfoModel;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    return Card(
      elevation: 6,
      margin: EdgeInsets.symmetric(vertical: sizeScreen.height * 0.01),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        leading: Icon(
          networkIpInfoModel.iconData,
        ),
        title: Text(networkIpInfoModel.titleText),
        subtitle: Text(networkIpInfoModel.subTitleText),
      ),
    );
  }
}
