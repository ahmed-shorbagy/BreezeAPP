part of 'get_user_locations_cubit.dart';

@immutable
sealed class GetUserLocationsState {}

final class GetUserLocationsInitial extends GetUserLocationsState {}

final class GetUserLocationsSuccess extends GetUserLocationsState {
  final List<Position> locations;

  GetUserLocationsSuccess(this.locations);
}

final class GetUserLocationsLoading extends GetUserLocationsState {}

final class GetUserLocationsError extends GetUserLocationsState {
  final String errMessage;

  GetUserLocationsError(this.errMessage);
}
