import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/home/data/models/current_weather_model/current_weather.dart';
import 'package:breeze_forecast/features/home/data/repositries/home_repo.dart';
import 'package:meta/meta.dart';

part 'current_weather_state.dart';

class CurrentWeatherCubit extends Cubit<CurrentWeatherState> {
  CurrentWeatherCubit(this.homeRepo) : super(CurrentWeatherInitial());
  final HomeRepo homeRepo;

  Future<void> getCurrentWeather(
      {required double lat, required double long}) async {
    emit(CurrentWeatherLoading());
    final result = await homeRepo.getCurrentWeather(lat: lat, long: long);
    result.fold(
      (err) => emit(CurrentWeatherError(err.errMessage)),
      (success) => emit(CurrentWeatherSuccess(success)),
    );
  }
}
