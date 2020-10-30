class GlobalPingsData {
  GlobalPingsData({
    this.userId,
    this.totalPings,
    this.lastPing,
    this.pings,
  });

  int userId;
  int totalPings;
  DateTime lastPing;

  //contactId: pingData
  Map<String, PingData> pings;
}

class PingData {
  PingData({
    this.totalPing = 0,
    this.lastPing,
  });

  int totalPing;
  DateTime lastPing;
}
