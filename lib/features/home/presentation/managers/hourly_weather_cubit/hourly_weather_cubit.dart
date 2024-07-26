import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/home/data/models/hourly_weather_model/hourly_weather_model.dart';
import 'package:breeze_forecast/features/home/data/repositries/home_repo.dart';
import 'package:meta/meta.dart';

part 'hourly_weather_state.dart';

class HourlyWeatherCubit extends Cubit<HourlyWeatherState> {
  HourlyWeatherCubit(this.homeRepo) : super(HourlyWeatherInitial());
  final HomeRepo homeRepo;

  Future<void> getHourlyWeather(
      {required double lat, required double long}) async {
    emit(HourlyWeatherLoading());
    final result = await homeRepo.getHourlyWeather(lat: lat, long: long);
    result.fold(
      (err) => emit(HourlyWeatherError(err.errMessage)),
      (success) => emit(HourlyWeatherSuccess(success)),
    );
  }
}
