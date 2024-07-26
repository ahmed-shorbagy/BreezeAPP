import 'dart:convert';

class HourlyUnits {
  String? time;
  String? relativeHumidity2m;
  String? apparentTemperature;
  String? isDay;
  String? precipitation;
  String? rain;
  String? windSpeed10m;

  HourlyUnits({
    this.time,
    this.relativeHumidity2m,
    this.apparentTemperature,
    this.isDay,
    this.precipitation,
    this.rain,
    this.windSpeed10m,
  });

  factory HourlyUnits.fromMap(Map<String, dynamic> data) => HourlyUnits(
        time: data['time'] as String?,
        relativeHumidity2m: data['relative_humidity_2m'] as String?,
        apparentTemperature: data['apparent_temperature'] as String?,
        isDay: data['is_day'] as String?,
        precipitation: data['precipitation'] as String?,
        rain: data['rain'] as String?,
        windSpeed10m: data['wind_speed_10m'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'time': time,
        'relative_humidity_2m': relativeHumidity2m,
        'apparent_temperature': apparentTemperature,
        'is_day': isDay,
        'precipitation': precipitation,
        'rain': rain,
        'wind_speed_10m': windSpeed10m,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HourlyUnits].
  factory HourlyUnits.fromJson(String data) {
    return HourlyUnits.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HourlyUnits] to a JSON string.
  String toJson() => json.encode(toMap());

  HourlyUnits copyWith({
    String? time,
    String? relativeHumidity2m,
    String? apparentTemperature,
    String? isDay,
    String? precipitation,
    String? rain,
    String? windSpeed10m,
  }) {
    return HourlyUnits(
      time: time ?? this.time,
      relativeHumidity2m: relativeHumidity2m ?? this.relativeHumidity2m,
      apparentTemperature: apparentTemperature ?? this.apparentTemperature,
      isDay: isDay ?? this.isDay,
      precipitation: precipitation ?? this.precipitation,
      rain: rain ?? this.rain,
      windSpeed10m: windSpeed10m ?? this.windSpeed10m,
    );
  }
}
