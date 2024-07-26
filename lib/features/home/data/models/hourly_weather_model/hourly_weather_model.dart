import 'dart:convert';

import 'hourly.dart';
import 'hourly_units.dart';

class HourlyWeatherModel {
  num? latitude;
  num? longitude;
  num? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  HourlyUnits? hourlyUnits;
  Hourly? hourly;

  HourlyWeatherModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.hourlyUnits,
    this.hourly,
  });

  factory HourlyWeatherModel.fromMap(Map<String, dynamic> data) {
    return HourlyWeatherModel(
      latitude: (data['latitude'] as num?)?.toDouble(),
      longitude: (data['longitude'] as num?)?.toDouble(),
      generationtimeMs: (data['generationtime_ms'] as num?)?.toDouble(),
      utcOffsetSeconds: data['utc_offset_seconds'] as num?,
      timezone: data['timezone'] as String?,
      timezoneAbbreviation: data['timezone_abbreviation'] as String?,
      elevation: data['elevation'] as num?,
      hourlyUnits: data['hourly_units'] == null
          ? null
          : HourlyUnits.fromMap(data['hourly_units'] as Map<String, dynamic>),
      hourly: data['hourly'] == null
          ? null
          : Hourly.fromMap(data['hourly'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toMap() => {
        'latitude': latitude,
        'longitude': longitude,
        'generationtime_ms': generationtimeMs,
        'utc_offset_seconds': utcOffsetSeconds,
        'timezone': timezone,
        'timezone_abbreviation': timezoneAbbreviation,
        'elevation': elevation,
        'hourly_units': hourlyUnits?.toMap(),
        'hourly': hourly?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [HourlyWeatherModel].
  factory HourlyWeatherModel.fromJson(String data) {
    return HourlyWeatherModel.fromMap(
        json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [HourlyWeatherModel] to a JSON string.
  String toJson() => json.encode(toMap());

  HourlyWeatherModel copyWith({
    num? latitude,
    num? longitude,
    num? generationtimeMs,
    num? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    num? elevation,
    HourlyUnits? hourlyUnits,
    Hourly? hourly,
  }) {
    return HourlyWeatherModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      generationtimeMs: generationtimeMs ?? this.generationtimeMs,
      utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
      timezone: timezone ?? this.timezone,
      timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
      elevation: elevation ?? this.elevation,
      hourlyUnits: hourlyUnits ?? this.hourlyUnits,
      hourly: hourly ?? this.hourly,
    );
  }
}
