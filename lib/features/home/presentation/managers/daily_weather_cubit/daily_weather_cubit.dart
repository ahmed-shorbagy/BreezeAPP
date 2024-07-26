import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/home/data/models/daily_weather_model/daily_weather_model.dart';
import 'package:breeze_forecast/features/home/data/repositries/home_repo.dart';
import 'package:meta/meta.dart';

part 'daily_weather_state.dart';

class DailyWeatherCubit extends Cubit<DailyWeatherState> {
  DailyWeatherCubit(this.homeRepo) : super(DailyWeatherInitial());
  final HomeRepo homeRepo;

  Future<void> getDailyWeather(
      {required double lat, required double long}) async {
    emit(DailyWeatherLoafing());
    final result = await homeRepo.getDailyWeather(lat: lat, long: long);
    result.fold(
      (err) => emit(DailyWeatherError(err.errMessage)),
      (success) => emit(DailyWeatherSuccess(success)),
    );
  }
}
