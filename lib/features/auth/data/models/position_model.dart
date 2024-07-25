class Position {
  double latitude;
  double longitude;
  String cityName;

  Position({
    required this.cityName,
    required this.latitude,
    required this.longitude,
  });

  Map<String, dynamic> toMap() {
    return {
      'latitude': latitude,
      'longitude': longitude,
      'cityName': cityName,
    };
  }

  factory Position.fromMap(Map<String, dynamic> map) {
    return Position(
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      cityName: map['cityName'] as String,
    );
  }
}
