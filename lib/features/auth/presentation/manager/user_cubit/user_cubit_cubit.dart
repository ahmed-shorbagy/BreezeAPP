import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:breeze_forecast/features/auth/data/models/position_model.dart';

part 'user_cubit_state.dart';

class UserCubit extends Cubit<UserCubitState> {
  UserCubit() : super(UserCubitInitial());
  static UserPosition position =
      UserPosition(latitude: 0, longitude: 0, cityName: '', timeStamp: '');

  void updatePosition(UserPosition newPosition) {
    log("new position AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA: ${newPosition.cityName}");
    emit(UserCubitPositionUpdated(newPosition));
  }
}
