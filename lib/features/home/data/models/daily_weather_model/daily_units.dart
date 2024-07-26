import 'dart:convert';

class DailyUnits {
  String? time;
  String? weatherCode;
  String? apparentTemperatureMax;
  String? apparentTemperatureMin;
  String? sunrise;
  String? sunset;
  String? daylightDuration;
  String? precipitationSum;
  String? rainSum;
  String? precipitationHours;
  String? precipitationProbabilityMax;
  String? windDirection10mDominant;

  DailyUnits({
    this.time,
    this.weatherCode,
    this.apparentTemperatureMax,
    this.apparentTemperatureMin,
    this.sunrise,
    this.sunset,
    this.daylightDuration,
    this.precipitationSum,
    this.rainSum,
    this.precipitationHours,
    this.precipitationProbabilityMax,
    this.windDirection10mDominant,
  });

  factory DailyUnits.fromMap(Map<String, dynamic> data) => DailyUnits(
        time: data['time'] as String?,
        weatherCode: data['weather_code'] as String?,
        apparentTemperatureMax: data['apparent_temperature_max'] as String?,
        apparentTemperatureMin: data['apparent_temperature_min'] as String?,
        sunrise: data['sunrise'] as String?,
        sunset: data['sunset'] as String?,
        daylightDuration: data['daylight_duration'] as String?,
        precipitationSum: data['precipitation_sum'] as String?,
        rainSum: data['rain_sum'] as String?,
        precipitationHours: data['precipitation_hours'] as String?,
        precipitationProbabilityMax:
            data['precipitation_probability_max'] as String?,
        windDirection10mDominant:
            data['wind_direction_10m_dominant'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'time': time,
        'weather_code': weatherCode,
        'apparent_temperature_max': apparentTemperatureMax,
        'apparent_temperature_min': apparentTemperatureMin,
        'sunrise': sunrise,
        'sunset': sunset,
        'daylight_duration': daylightDuration,
        'precipitation_sum': precipitationSum,
        'rain_sum': rainSum,
        'precipitation_hours': precipitationHours,
        'precipitation_probability_max': precipitationProbabilityMax,
        'wind_direction_10m_dominant': windDirection10mDominant,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [DailyUnits].
  factory DailyUnits.fromJson(String data) {
    return DailyUnits.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [DailyUnits] to a JSON string.
  String toJson() => json.encode(toMap());

  DailyUnits copyWith({
    String? time,
    String? weatherCode,
    String? apparentTemperatureMax,
    String? apparentTemperatureMin,
    String? sunrise,
    String? sunset,
    String? daylightDuration,
    String? precipitationSum,
    String? rainSum,
    String? precipitationHours,
    String? precipitationProbabilityMax,
    String? windDirection10mDominant,
  }) {
    return DailyUnits(
      time: time ?? this.time,
      weatherCode: weatherCode ?? this.weatherCode,
      apparentTemperatureMax:
          apparentTemperatureMax ?? this.apparentTemperatureMax,
      apparentTemperatureMin:
          apparentTemperatureMin ?? this.apparentTemperatureMin,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      daylightDuration: daylightDuration ?? this.daylightDuration,
      precipitationSum: precipitationSum ?? this.precipitationSum,
      rainSum: rainSum ?? this.rainSum,
      precipitationHours: precipitationHours ?? this.precipitationHours,
      precipitationProbabilityMax:
          precipitationProbabilityMax ?? this.precipitationProbabilityMax,
      windDirection10mDominant:
          windDirection10mDominant ?? this.windDirection10mDominant,
    );
  }
}
