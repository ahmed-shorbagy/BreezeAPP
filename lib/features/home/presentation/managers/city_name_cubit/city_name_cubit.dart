import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:breeze_forecast/features/home/data/models/city_from_location_model/city_from_location_model.dart';
import 'package:breeze_forecast/features/home/data/repositries/home_repo.dart';
import 'package:meta/meta.dart';

part 'city_name_state.dart';

class CityFromLocationCubit extends Cubit<CityFromLocationState> {
  CityFromLocationCubit(this.homeRepo) : super(CityFromLocationInitial());
  final HomeRepo homeRepo;
  String cityName = '';

  Future<void> getCityName({required double lat, required double long}) async {
    emit(CityFromLocationLoading());
    final result = await homeRepo.getReverseGeocode(lat: lat, long: long);
    result.fold((err) {
      emit(CityFromLocationError(err.errMessage));
    }, (citymodel) {
      emit(CityFromLocationSuccess(cityNameModel: citymodel));
      cityName = citymodel.address?.city ?? "";
      UserCubit.position.cityName = cityName;
    });
  }
}
