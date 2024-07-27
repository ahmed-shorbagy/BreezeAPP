part of 'delte_user_location_cubit.dart';

@immutable
sealed class DelteUserLocationState {}

final class DelteUserLocationInitial extends DelteUserLocationState {}

final class DelteUserLocationLoading extends DelteUserLocationState {}

final class DelteUserLocationSuccess extends DelteUserLocationState {}

final class DelteUserLocationError extends DelteUserLocationState {
  final String errMessage;

  DelteUserLocationError(this.errMessage);
}
