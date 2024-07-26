part of 'hourly_weather_cubit.dart';

@immutable
sealed class HourlyWeatherState {}

final class HourlyWeatherInitial extends HourlyWeatherState {}

final class HourlyWeatherLoading extends HourlyWeatherState {}

final class HourlyWeatherSuccess extends HourlyWeatherState {
  final HourlyWeatherModel hourlyWeatherModel;

  HourlyWeatherSuccess(this.hourlyWeatherModel);
}

final class HourlyWeatherError extends HourlyWeatherState {
  final String errMessage;

  HourlyWeatherError(this.errMessage);
}
