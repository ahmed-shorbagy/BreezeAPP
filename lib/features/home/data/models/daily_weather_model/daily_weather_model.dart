import 'dart:convert';

import 'current.dart';
import 'current_units.dart';
import 'daily.dart';
import 'daily_units.dart';

class DailyWeatherModel {
  double? latitude;
  double? longitude;
  double? generationtimeMs;
  num? utcOffsetSeconds;
  String? timezone;
  String? timezoneAbbreviation;
  num? elevation;
  CurrentUnits? currentUnits;
  Current? current;
  DailyUnits? dailyUnits;
  Daily? daily;

  DailyWeatherModel({
    this.latitude,
    this.longitude,
    this.generationtimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
    this.dailyUnits,
    this.daily,
  });

  factory DailyWeatherModel.fromMap(Map<String, dynamic> data) {
    return DailyWeatherModel(
      latitude: (data['latitude'] as num?)?.toDouble(),
      longitude: (data['longitude'] as num?)?.toDouble(),
      generationtimeMs: (data['generationtime_ms'] as num?)?.toDouble(),
      utcOffsetSeconds: data['utc_offset_seconds'] as num?,
      timezone: data['timezone'] as String?,
      timezoneAbbreviation: data['timezone_abbreviation'] as String?,
      elevation: data['elevation'] as num?,
      currentUnits: data['current_units'] == null
          ? null
          : CurrentUnits.fromMap(data['current_units'] as Map<String, dynamic>),
      current: data['current'] == null
          ? null
          : Current.fromMap(data['current'] as Map<String, dynamic>),
      dailyUnits: data['daily_units'] == null
          ? null
          : DailyUnits.fromMap(data['daily_units'] as Map<String, dynamic>),
      daily: data['daily'] == null
          ? null
          : Daily.fromMap(data['daily'] as Map<String, dynamic>),
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
        'current_units': currentUnits?.toMap(),
        'current': current?.toMap(),
        'daily_units': dailyUnits?.toMap(),
        'daily': daily?.toMap(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DailyWeatherModel].
  factory DailyWeatherModel.fromJson(String data) {
    return DailyWeatherModel.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DailyWeatherModel] to a JSON string.
  String toJson() => json.encode(toMap());

  DailyWeatherModel copyWith({
    double? latitude,
    double? longitude,
    double? generationtimeMs,
    num? utcOffsetSeconds,
    String? timezone,
    String? timezoneAbbreviation,
    num? elevation,
    CurrentUnits? currentUnits,
    Current? current,
    DailyUnits? dailyUnits,
    Daily? daily,
  }) {
    return DailyWeatherModel(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      generationtimeMs: generationtimeMs ?? this.generationtimeMs,
      utcOffsetSeconds: utcOffsetSeconds ?? this.utcOffsetSeconds,
      timezone: timezone ?? this.timezone,
      timezoneAbbreviation: timezoneAbbreviation ?? this.timezoneAbbreviation,
      elevation: elevation ?? this.elevation,
      currentUnits: currentUnits ?? this.currentUnits,
      current: current ?? this.current,
      dailyUnits: dailyUnits ?? this.dailyUnits,
      daily: daily ?? this.daily,
    );
  }
}
