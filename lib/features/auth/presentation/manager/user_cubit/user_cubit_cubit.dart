import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/features/auth/data/models/position_model.dart';
import 'package:meta/meta.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit() : super(UserCubitInitial());
  static Position position = Position(latitude: 0, longitude: 0, cityName: '');
}
