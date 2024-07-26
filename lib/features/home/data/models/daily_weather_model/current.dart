import 'dart:convert';

class Current {
  String? time;
  int? interval;
  double? windSpeed10m;

  Current({this.time, this.interval, this.windSpeed10m});

  factory Current.fromMap(Map<String, dynamic> data) => Current(
        time: data['time'] as String?,
        interval: data['interval'] as int?,
        windSpeed10m: (data['wind_speed_10m'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toMap() => {
        'time': time,
        'interval': interval,
        'wind_speed_10m': windSpeed10m,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Current].
  factory Current.fromJson(String data) {
    return Current.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Current] to a JSON string.
  String toJson() => json.encode(toMap());

  Current copyWith({
    String? time,
    int? interval,
    double? windSpeed10m,
  }) {
    return Current(
      time: time ?? this.time,
      interval: interval ?? this.interval,
      windSpeed10m: windSpeed10m ?? this.windSpeed10m,
    );
  }
}
