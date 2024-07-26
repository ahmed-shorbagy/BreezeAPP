import 'dart:convert';

class Daily {
  List<dynamic>? time;
  List<dynamic>? weatherCode;
  List<dynamic>? apparentTemperatureMax;
  List<dynamic>? apparentTemperatureMin;
  List<dynamic>? sunrise;
  List<dynamic>? sunset;
  List<dynamic>? daylightDuration;
  List<dynamic>? precipitationSum;
  List<dynamic>? rainSum;
  List<dynamic>? precipitationHours;
  List<dynamic>? precipitationProbabilityMax;
  List<dynamic>? windDirection10mDominant;

  Daily({
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

  factory Daily.fromMap(Map<String, dynamic> data) => Daily(
        time: data['time'] as List<dynamic>?,
        weatherCode: data['weather_code'] as List<dynamic>?,
        apparentTemperatureMax:
            data['apparent_temperature_max'] as List<dynamic>?,
        apparentTemperatureMin:
            data['apparent_temperature_min'] as List<dynamic>?,
        sunrise: data['sunrise'] as List<dynamic>?,
        sunset: data['sunset'] as List<dynamic>?,
        daylightDuration: data['daylight_duration'] as List<dynamic>?,
        precipitationSum: data['precipitation_sum'] as List<dynamic>?,
        rainSum: data['rain_sum'] as List<dynamic>?,
        precipitationHours: data['precipitation_hours'] as List<dynamic>?,
        precipitationProbabilityMax:
            data['precipitation_probability_max'] as List<dynamic>?,
        windDirection10mDominant:
            data['wind_direction_10m_dominant'] as List<dynamic>?,
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
  /// Parses the string and returns the resulting Json object as [Daily].
  factory Daily.fromJson(String data) {
    return Daily.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Daily] to a JSON string.
  String toJson() => json.encode(toMap());

  Daily copyWith({
    List<dynamic>? time,
    List<dynamic>? weatherCode,
    List<dynamic>? apparentTemperatureMax,
    List<dynamic>? apparentTemperatureMin,
    List<dynamic>? sunrise,
    List<dynamic>? sunset,
    List<dynamic>? daylightDuration,
    List<dynamic>? precipitationSum,
    List<dynamic>? rainSum,
    List<dynamic>? precipitationHours,
    List<dynamic>? precipitationProbabilityMax,
    List<dynamic>? windDirection10mDominant,
  }) {
    return Daily(
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
