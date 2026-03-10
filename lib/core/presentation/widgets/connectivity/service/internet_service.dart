class InternetStatus {
  final bool hasInternet;
  final bool isWifi;
  final bool isMobile;

  const InternetStatus({
    required this.hasInternet,
    required this.isWifi,
    required this.isMobile,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InternetStatus &&
          runtimeType == other.runtimeType &&
          hasInternet == other.hasInternet &&
          isWifi == other.isWifi &&
          isMobile == other.isMobile;

  @override
  int get hashCode =>
      hasInternet.hashCode ^ isWifi.hashCode ^ isMobile.hashCode;
}
