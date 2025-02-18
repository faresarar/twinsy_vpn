class VpnStatusModel {
  String? byteIn;
  String? byteOut;
  String? durationTime;
  String? lastPackageReceive;

  VpnStatusModel({
    this.byteIn,
    this.byteOut,
    this.durationTime,
    this.lastPackageReceive,
  });
  factory VpnStatusModel.fromJson(Map<String, dynamic> jsonData) =>
      VpnStatusModel(
        byteIn: jsonData["byte_in"],
        byteOut: jsonData["byte_out"],
        durationTime: jsonData["duration"],
        lastPackageReceive: jsonData["last_packet_receive"],
      );
  Map<String, dynamic> toJson() {
    final jsonData = <String,dynamic>{};
    jsonData['byte_in']= byteIn;
    jsonData['byte_out']= byteOut;
    jsonData['duration']=durationTime;
    jsonData['last_packet_receive'] = lastPackageReceive;
    return jsonData;
  }
}
