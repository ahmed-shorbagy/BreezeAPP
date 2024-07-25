part of 'current_weather_cubit.dart';

@immutable
sealed class CurrentWeatherState {}

final class CurrentWeatherInitial extends CurrentWeatherState {}

final class CurrentWeatherSuccess extends CurrentWeatherState {
  final CurrentWeatherModel currentWeatherModel;

  CurrentWeatherSuccess(this.currentWeatherModel);
}

final class CurrentWeatherLoading extends CurrentWeatherState {}

final class CurrentWeatherError extends CurrentWeatherState {
  final String errMessage;

  CurrentWeatherError(this.errMessage);
}
