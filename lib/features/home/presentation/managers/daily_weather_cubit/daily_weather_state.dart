part of 'daily_weather_cubit.dart';

@immutable
sealed class DailyWeatherState {}

final class DailyWeatherInitial extends DailyWeatherState {}

final class DailyWeatherLoafing extends DailyWeatherState {}

final class DailyWeatherSuccess extends DailyWeatherState {
  final DailyWeatherModel dailyWeatherModel;

  DailyWeatherSuccess(this.dailyWeatherModel);
}

final class DailyWeatherError extends DailyWeatherState {
  final String errMessage;

  DailyWeatherError(this.errMessage);
}
