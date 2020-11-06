class GlobalPingsData {
  int totalPings = 0;
  DateTime lastPing;
  List<String> contactPinged = <String>[];

  //contactId: pingData
  Map<String, PingData> pings = <String, PingData>{};
}

class PingData {
  PingData({
    this.totalPing = 0,
    this.lastPing,
  });

  int totalPing = 0;
  DateTime lastPing;
}
