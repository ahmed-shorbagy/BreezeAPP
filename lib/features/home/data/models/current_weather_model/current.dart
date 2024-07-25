import 'package:collection/collection.dart';

class Current {
  final String? time;
  final int? interval;
  final double? temperature2m;
  final int? relativeHumidity2m;
  final double? apparentTemperature;
  final int? isDay;
  final int? precipitation;
  final int? rain;
  final int? showers;
  final int? snowfall;
  final int? weatherCode;
  final int? cloudCover;
  final double? pressureMsl;
  final double? surfacePressure;
  final int? windSpeed10m;
  final int? windDirection10m;
  final double? windGusts10m;

  const Current({
    this.time,
    this.interval,
    this.temperature2m,
    this.relativeHumidity2m,
    this.apparentTemperature,
    this.isDay,
    this.precipitation,
    this.rain,
    this.showers,
    this.snowfall,
    this.weatherCode,
    this.cloudCover,
    this.pressureMsl,
    this.surfacePressure,
    this.windSpeed10m,
    this.windDirection10m,
    this.windGusts10m,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        time: json['time'] as String?,
        interval: json['interval'] as int?,
        temperature2m: (json['temperature_2m'] as num?)?.toDouble(),
        relativeHumidity2m: json['relative_humidity_2m'] as int?,
        apparentTemperature: (json['apparent_temperature'] as num?)?.toDouble(),
        isDay: json['is_day'] as int?,
        precipitation: json['precipitation'] as int?,
        rain: json['rain'] as int?,
        showers: json['showers'] as int?,
        snowfall: json['snowfall'] as int?,
        weatherCode: json['weather_code'] as int?,
        cloudCover: json['cloud_cover'] as int?,
        pressureMsl: (json['pressure_msl'] as num?)?.toDouble(),
        surfacePressure: (json['surface_pressure'] as num?)?.toDouble(),
        windSpeed10m: json['wind_speed_10m'] as int?,
        windDirection10m: json['wind_direction_10m'] as int?,
        windGusts10m: (json['wind_gusts_10m'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'time': time,
        'interval': interval,
        'temperature_2m': temperature2m,
        'relative_humidity_2m': relativeHumidity2m,
        'apparent_temperature': apparentTemperature,
        'is_day': isDay,
        'precipitation': precipitation,
        'rain': rain,
        'showers': showers,
        'snowfall': snowfall,
        'weather_code': weatherCode,
        'cloud_cover': cloudCover,
        'pressure_msl': pressureMsl,
        'surface_pressure': surfacePressure,
        'wind_speed_10m': windSpeed10m,
        'wind_direction_10m': windDirection10m,
        'wind_gusts_10m': windGusts10m,
      };

  Current copyWith({
    String? time,
    int? interval,
    double? temperature2m,
    int? relativeHumidity2m,
    double? apparentTemperature,
    int? isDay,
    int? precipitation,
    int? rain,
    int? showers,
    int? snowfall,
    int? weatherCode,
    int? cloudCover,
    double? pressureMsl,
    double? surfacePressure,
    int? windSpeed10m,
    int? windDirection10m,
    double? windGusts10m,
  }) {
    return Current(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      temperature2m: temperature2m ?? this.temperature2m,
      relativeHumidity2m: relativeHumidity2m ?? this.relativeHumidity2m,
      apparentTemperature: apparentTemperature ?? this.apparentTemperature,
      isDay: isDay ?? this.isDay,
      precipitation: precipitation ?? this.precipitation,
      rain: rain ?? this.rain,
      showers: showers ?? this.showers,
      snowfall: snowfall ?? this.snowfall,
      weatherCode: weatherCode ?? this.weatherCode,
      cloudCover: cloudCover ?? this.cloudCover,
      pressureMsl: pressureMsl ?? this.pressureMsl,
      surfacePressure: surfacePressure ?? this.surfacePressure,
      windSpeed10m: windSpeed10m ?? this.windSpeed10m,
      windDirection10m: windDirection10m ?? this.windDirection10m,
      windGusts10m: windGusts10m ?? this.windGusts10m,
    );
  }
}
