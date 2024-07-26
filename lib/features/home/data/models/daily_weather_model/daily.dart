import 'dart:convert';

class Daily {
  List<String>? time;
  List<int>? weatherCode;
  List<double>? apparentTemperatureMax;
  List<double>? apparentTemperatureMin;
  List<String>? sunrise;
  List<String>? sunset;
  List<double>? daylightDuration;
  List<num>? precipitationSum;
  List<num>? rainSum;
  List<int>? precipitationHours;
  List<int>? precipitationProbabilityMax;
  List<int>? windDirection10mDominant;

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
        time: data['time'] as List<String>?,
        weatherCode: data['weather_code'] as List<int>?,
        apparentTemperatureMax:
            data['apparent_temperature_max'] as List<double>?,
        apparentTemperatureMin:
            data['apparent_temperature_min'] as List<double>?,
        sunrise: data['sunrise'] as List<String>?,
        sunset: data['sunset'] as List<String>?,
        daylightDuration: data['daylight_duration'] as List<double>?,
        precipitationSum: data['precipitation_sum'] as List<num>?,
        rainSum: data['rain_sum'] as List<num>?,
        precipitationHours: data['precipitation_hours'] as List<int>?,
        precipitationProbabilityMax:
            data['precipitation_probability_max'] as List<int>?,
        windDirection10mDominant:
            data['wind_direction_10m_dominant'] as List<int>?,
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
    List<String>? time,
    List<int>? weatherCode,
    List<double>? apparentTemperatureMax,
    List<double>? apparentTemperatureMin,
    List<String>? sunrise,
    List<String>? sunset,
    List<double>? daylightDuration,
    List<num>? precipitationSum,
    List<num>? rainSum,
    List<int>? precipitationHours,
    List<int>? precipitationProbabilityMax,
    List<int>? windDirection10mDominant,
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
