import 'package:get/get.dart';

import '../App Preferences/app_preferences.dart';
import '../models/vpn_info_model.dart';
import '../services/api_vpn_gate.dart';

class VpnLocationController extends GetxController {
  List<VpnInfoModel> freeVpnServersAvailableList = AppPreferences.vpnList;
  final RxBool isLoadingNewLocation = false.obs;
  Future<void> retrieveVpnInformation() async {
    isLoadingNewLocation.value = true;
    freeVpnServersAvailableList.clear();
    freeVpnServersAvailableList =
        await ApiVpnGate.retrieveAllAvailableFreeVpnServers();
    isLoadingNewLocation.value = false;
  }
}
