class CurrentUnits {
  final String? time;
  final String? interval;
  final String? temperature2m;
  final String? relativeHumidity2m;
  final String? apparentTemperature;
  final String? isDay;
  final String? precipitation;
  final String? rain;
  final String? showers;
  final String? snowfall;
  final String? weatherCode;
  final String? cloudCover;
  final String? pressureMsl;
  final String? surfacePressure;
  final String? windSpeed10m;
  final String? windDirection10m;
  final String? windGusts10m;

  const CurrentUnits({
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

  factory CurrentUnits.fromJson(Map<String, dynamic> json) => CurrentUnits(
        time: json['time'] as String?,
        interval: json['interval'] as String?,
        temperature2m: json['temperature_2m'] as String?,
        relativeHumidity2m: json['relative_humidity_2m'] as String?,
        apparentTemperature: json['apparent_temperature'] as String?,
        isDay: json['is_day'] as String?,
        precipitation: json['precipitation'] as String?,
        rain: json['rain'] as String?,
        showers: json['showers'] as String?,
        snowfall: json['snowfall'] as String?,
        weatherCode: json['weather_code'] as String?,
        cloudCover: json['cloud_cover'] as String?,
        pressureMsl: json['pressure_msl'] as String?,
        surfacePressure: json['surface_pressure'] as String?,
        windSpeed10m: json['wind_speed_10m'] as String?,
        windDirection10m: json['wind_direction_10m'] as String?,
        windGusts10m: json['wind_gusts_10m'] as String?,
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

  CurrentUnits copyWith({
    String? time,
    String? interval,
    String? temperature2m,
    String? relativeHumidity2m,
    String? apparentTemperature,
    String? isDay,
    String? precipitation,
    String? rain,
    String? showers,
    String? snowfall,
    String? weatherCode,
    String? cloudCover,
    String? pressureMsl,
    String? surfacePressure,
    String? windSpeed10m,
    String? windDirection10m,
    String? windGusts10m,
  }) {
    return CurrentUnits(
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
