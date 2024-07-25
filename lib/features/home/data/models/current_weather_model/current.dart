import 'package:collection/collection.dart';

class Current {
  final String? time;
  final num? interval;
  final num? temperature2m;
  final num? relativeHumidity2m;
  final num? apparentTemperature;
  final num? isDay;
  final num? precipitation;
  final num? rain;
  final num? showers;
  final num? snowfall;
  final num? weatherCode;
  final num? cloudCover;
  final num? pressureMsl;
  final num? surfacePressure;
  final num? windSpeed10m;
  final num? windDirection10m;
  final num? windGusts10m;

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
        interval: json['interval'] as num?,
        temperature2m: (json['temperature_2m'] as num?)?.toDouble(),
        relativeHumidity2m: json['relative_humidity_2m'] as num?,
        apparentTemperature: (json['apparent_temperature'] as num?)?.toDouble(),
        isDay: json['is_day'] as num?,
        precipitation: json['precipitation'] as num?,
        rain: json['rain'] as num?,
        showers: json['showers'] as num?,
        snowfall: json['snowfall'] as num?,
        weatherCode: json['weather_code'] as num?,
        cloudCover: json['cloud_cover'] as num?,
        pressureMsl: (json['pressure_msl'] as num?)?.toDouble(),
        surfacePressure: (json['surface_pressure'] as num?)?.toDouble(),
        windSpeed10m: json['wind_speed_10m'] as num?,
        windDirection10m: json['wind_direction_10m'] as num?,
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
    num? interval,
    num? temperature2m,
    num? relativeHumidity2m,
    num? apparentTemperature,
    num? isDay,
    num? precipitation,
    num? rain,
    num? showers,
    num? snowfall,
    num? weatherCode,
    num? cloudCover,
    num? pressureMsl,
    num? surfacePressure,
    num? windSpeed10m,
    num? windDirection10m,
    num? windGusts10m,
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
