import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'delte_user_location_state.dart';

class DelteUserLocationCubit extends Cubit<DelteUserLocationState> {
  DelteUserLocationCubit(this.authRepo) : super(DelteUserLocationInitial());
  final AuthRepo authRepo;
  Future<void> deleteLocation({required String cityName}) async {
    final deletion = await authRepo.deleteLocation(
        userId: auth.currentUser!.uid, cityName: cityName);
    deletion.fold((err) {
      emit(DelteUserLocationError(err.errMessage));
    }, (success) {
      emit(DelteUserLocationSuccess());
    });
  }
}
