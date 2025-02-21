class VpnInfoModel {
  late final String hostName;
  late final String ipAddress;
  late final String ping;
  late final int speed;
  late final String countryLongName;
  late final String countryShortName;
  late final int vpnSessionsNumber;
  late final String base640VpnConfigurationData;

  VpnInfoModel({
    required this.hostName,
    required this.ipAddress,
    required this.ping,
    required this.speed,
    required this.countryLongName,
    required this.countryShortName,
    required this.vpnSessionsNumber,
    required this.base640VpnConfigurationData,
  });

  VpnInfoModel.fromJson(Map<String, dynamic> jsonData) {
    hostName = jsonData['HostName'] ?? "";
    ipAddress = jsonData['IP'] ?? "";
    ping = jsonData['Ping'].toString() ?? "";
    speed = jsonData['Speed'] ?? 0;
    countryLongName = jsonData['CountryLong'] ?? "";
    countryShortName = jsonData['CountryShort'] ?? "";
    vpnSessionsNumber = jsonData['NumVpnSessions'] ?? 0;
    base640VpnConfigurationData = jsonData['OpenVpn_ConfigData_Base64'] ?? "";
  }

  Map<String, dynamic> toJson() {
    final jsonData = <String,dynamic>{};
    jsonData['HostName']= hostName;
    jsonData['IP']= ipAddress;
    jsonData['Ping']=ping;
    jsonData['Speed'] = speed;
    jsonData['CountryLong']= countryLongName;
    jsonData['CountryShort']= countryShortName;
    jsonData['NumVpnSessions']= vpnSessionsNumber;
    jsonData['OpenVpn_ConfigData_Base64']=  base640VpnConfigurationData;
    return jsonData;
  }
}