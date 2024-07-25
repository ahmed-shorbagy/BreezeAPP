import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:meta/meta.dart';

part 'save_user_location_state.dart';

class SaveUserLocationCubit extends Cubit<SaveUserLocationState> {
  SaveUserLocationCubit(this.authRepo) : super(SaveUserLocationInitial());
  final AuthRepo authRepo;

  Future<void> saveUserLocation(double latitude, double longitude) async {
    emit(SaveUserLocationLoading());
    try {
      await authRepo.saveUserLocation(
          latitude: latitude,
          longitude: longitude,
          userId: auth.currentUser!.uid);
      emit(SaveUserLocationSuccess());
    } catch (e) {
      emit(SaveUserLocationError(e.toString()));
    }
  }
}
