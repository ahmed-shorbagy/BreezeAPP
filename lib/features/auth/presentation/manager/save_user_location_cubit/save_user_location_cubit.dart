import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:meta/meta.dart';

part 'save_user_location_state.dart';

class SaveUserLocationCubit extends Cubit<SaveUserLocationState> {
  SaveUserLocationCubit(this.authRepo) : super(SaveUserLocationInitial());
  final AuthRepo authRepo;

  Future<void> saveUserLocation(
      {required double latitude, required double longitude}) async {
    emit(SaveUserLocationLoading());
    final result = await authRepo.saveUserLocation(
        userId: auth.currentUser!.uid,
        latitude: latitude,
        longitude: longitude,
        cityName: UserCubit.position.cityName);
    result.fold((err) {
      emit(SaveUserLocationError(err.errMessage));
    }, (success) {
      emit(SaveUserLocationSuccess());
    });
  }
}
