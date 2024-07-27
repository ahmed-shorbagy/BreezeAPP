class UserPosition {
  double latitude;
  double longitude;
  String cityName;
  String timeStamp;

  UserPosition({
    required this.cityName,
    required this.latitude,
    required this.longitude,
    required this.timeStamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'cityName': cityName,
      'timestamp': timeStamp
    };
  }

  factory UserPosition.fromMap(Map<String, dynamic> map) {
    return UserPosition(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      cityName: map['city'] as String,
      timeStamp: map['timestamp'] as String,
    );
  }
}
