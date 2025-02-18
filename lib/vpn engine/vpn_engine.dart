import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:twinsy_vpn/models/vpn_configuration_model.dart';

import '../models/vpn_status_model.dart';

class VpnEngine {
  /// Native Channel
  static final String eventChannelVpnStage = "vpnStage";
  static final String eventChannelVpnStatus = "vpnStatus";
  static final String eventChannelVpnController = "vpnController";

  /// Vpn Connection Stage Snapshot
  static Stream<String> snapshotVpnStage() =>
      EventChannel(eventChannelVpnStage).receiveBroadcastStream().cast();

  /// Vpn Connection Status Snapshot
  static Stream<String> snapshotVpnStatus() =>
      EventChannel(eventChannelVpnStatus)
          .receiveBroadcastStream()
          .map(
            (eventStatus) => VpnStatusModel.fromJson(jsonDecode(eventStatus)),
          )
          .cast();

  /// Start Vpn Now
  static Future<void> startVpnNow(
      VpnConfigurationModel vpnConfiguration) async {
    return MethodChannel(eventChannelVpnController).invokeMethod("start", {
      "config": vpnConfiguration.config,
      "country": vpnConfiguration.countryName,
      "username": vpnConfiguration.userName,
      "password": vpnConfiguration.password
    });
  }

  /// Stop Vpn Now
  static Future<void> stopVpnNow(VpnConfigurationModel vpnConfiguration) async {
    return MethodChannel(eventChannelVpnController).invokeMethod("stop");
  }

  /// Kill Switch Vpn Now
  static Future<void> killSwitchOpenNow(
      VpnConfigurationModel vpnConfiguration) async {
    return MethodChannel(eventChannelVpnController).invokeMethod("kill_switch");
  }

  /// Refresh Stag Now
  static Future<void> refreshStageNow(
      VpnConfigurationModel vpnConfiguration) async {
    return MethodChannel(eventChannelVpnController).invokeMethod("refresh");
  }

  /// Get Stag Now
  static Future<String?> getStageNow() async {
    return MethodChannel(eventChannelVpnController).invokeMethod("stage");
  }

  /// Get  Is Connect Now
  static Future<bool> getIsConnectNow(
      VpnConfigurationModel vpnConfiguration) async {
    return getStageNow().then((value) => value!.toLowerCase() == "connected");
  }

  /// Stages of Vpn Connections
  static const String vpnConnectNow = "connected";
  static const String vpnDisConnectNow = "disconnected";
  static const String vpnWaitConnectNow = "wait_connected";
  static const String vpnAuthenticatingConnectNow = "authenticating";
  static const String vpnReConnectNow = "reconnect";
  static const String vpnNoConnectionNow = "no_connection";
  static const String vpnConnectingNow = "connecting";
  static const String vpnPrepareNow = "prepare";
  static const String vpnDeniedNow = "denied";

}
