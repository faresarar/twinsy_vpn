import 'package:get/get.dart';

import '../App Preferences/app_preferences.dart';
import '../models/vpn_info_model.dart';

class HomeController extends GetxController {
  final Rx<VpnInfoModel> vpnInfo = AppPreferences.vpnInfoModelObject.obs;
}
