class GlobalPingsData {
  GlobalPingsData({
    this.userId,
    this.totalPings,
    this.lastPing,
  });

  int userId;
  int totalPings;
  DateTime lastPing;

  //contactId: pingData
  Map<String, PingData> pings = <String, PingData>{};
}

class PingData {
  PingData({
    this.totalPing = 0,
    this.lastPing,
  });

  int totalPing;
  DateTime lastPing;
}
