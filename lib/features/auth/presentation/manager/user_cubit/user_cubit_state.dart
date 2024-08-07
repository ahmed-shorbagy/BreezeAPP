part of 'user_cubit_cubit.dart';

@immutable
sealed class UserCubitState {}

class UserCubitInitial extends UserCubitState {}

class UserCubitPositionUpdated extends UserCubitState {
  final UserPosition position;

  UserCubitPositionUpdated(this.position);
}
