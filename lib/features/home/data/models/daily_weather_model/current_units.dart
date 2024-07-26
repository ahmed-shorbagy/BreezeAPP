import 'dart:convert';

class CurrentUnits {
  String? time;
  String? interval;
  String? windSpeed10m;

  CurrentUnits({this.time, this.interval, this.windSpeed10m});

  factory CurrentUnits.fromMap(Map<String, dynamic> data) => CurrentUnits(
        time: data['time'] as String?,
        interval: data['interval'] as String?,
        windSpeed10m: data['wind_speed_10m'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'time': time,
        'interval': interval,
        'wind_speed_10m': windSpeed10m,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [CurrentUnits].
  factory CurrentUnits.fromJson(String data) {
    return CurrentUnits.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [CurrentUnits] to a JSON string.
  String toJson() => json.encode(toMap());

  CurrentUnits copyWith({
    String? time,
    String? interval,
    String? windSpeed10m,
  }) {
    return CurrentUnits(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      windSpeed10m: windSpeed10m ?? this.windSpeed10m,
    );
  }
}
