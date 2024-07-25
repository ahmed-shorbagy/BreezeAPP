import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/auth/data/models/position_model.dart';
import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:meta/meta.dart';

part 'get_user_locations_state.dart';

class GetUserLocationsCubit extends Cubit<GetUserLocationsState> {
  GetUserLocationsCubit(this.authRepo) : super(GetUserLocationsInitial());
  final AuthRepo authRepo;

  Future<void> getUserLocations() async {
    emit(GetUserLocationsLoading());
    try {
      final locations =
          await authRepo.getUserLocations(userId: auth.currentUser!.uid);
      emit(GetUserLocationsSuccess(locations));
    } catch (e) {
      emit(GetUserLocationsError(e.toString()));
    }
  }
}
