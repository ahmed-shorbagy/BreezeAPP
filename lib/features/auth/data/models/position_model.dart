class Position {
  double latitude;
  double longitude;
  String cityName;
  String timeStamp;

  Position({
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

  factory Position.fromMap(Map<String, dynamic> map) {
    return Position(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      cityName: map['city'] as String,
      timeStamp: map['timestamp'] as String,
    );
  }
}
