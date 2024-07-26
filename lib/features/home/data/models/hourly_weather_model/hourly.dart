import 'dart:convert';

class Hourly {
  List<dynamic>? time;
  List<dynamic>? relativeHumidity2m;
  List<dynamic>? apparentTemperature;
  List<dynamic>? isDay;
  List<dynamic>? precipitation;
  List<dynamic>? rain;
  List<dynamic>? windSpeed10m;

  Hourly({
    this.time,
    this.relativeHumidity2m,
    this.apparentTemperature,
    this.isDay,
    this.precipitation,
    this.rain,
    this.windSpeed10m,
  });

  factory Hourly.fromMap(Map<String, dynamic> data) => Hourly(
        time: data['time'] as List<dynamic>?,
        relativeHumidity2m: data['relative_humidity_2m'] as List<dynamic>?,
        apparentTemperature: data['apparent_temperature'] as List<dynamic>?,
        isDay: data['is_day'] as List<dynamic>?,
        precipitation: data['precipitation'] as List<dynamic>?,
        rain: data['rain'] as List<dynamic>?,
        windSpeed10m: data['wind_speed_10m'] as List<dynamic>?,
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
  /// Parses the string and returns the resulting Json object as [Hourly].
  factory Hourly.fromJson(String data) {
    return Hourly.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Hourly] to a JSON string.
  String toJson() => json.encode(toMap());

  Hourly copyWith({
    List<String>? time,
    List<dynamic>? relativeHumidity2m,
    List<dynamic>? apparentTemperature,
    List<dynamic>? isDay,
    List<dynamic>? precipitation,
    List<dynamic>? rain,
    List<dynamic>? windSpeed10m,
  }) {
    return Hourly(
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
