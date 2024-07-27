import 'package:breeze_forecast/core/utils/app_router.dart';
import 'package:breeze_forecast/core/utils/helper_methodes.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/get_user_locations_cubit/get_user_locations_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/save_user_location_cubit/save_user_location_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/managers/current_weather_cubit/current_weather_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/saved_locations_list_item.dart';
import 'package:breeze_forecast/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SavedLocationsView extends StatelessWidget {
  const SavedLocationsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () =>
                GoRouter.of(context).pushReplacement(AppRouter.kHomeView),
            icon: const Icon(Icons.arrow_back_ios)),
        title: Text(S.of(context).SavedLocations),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              await BlocProvider.of<SaveUserLocationCubit>(context)
                  .saveUserLocation(
                latitude: UserCubit.position.latitude,
                longitude: UserCubit.position.longitude,
              );
              await BlocProvider.of<GetUserLocationsCubit>(context)
                  .getUserLocations();
              await BlocProvider.of<CurrentWeatherCubit>(context)
                  .getCurrentWeather(
                lat: UserCubit.position.latitude,
                long: UserCubit.position.longitude,
              );
            },
          ),
          BlocListener<SaveUserLocationCubit, SaveUserLocationState>(
            listener: (context, state) {
              if (state is SaveUserLocationSuccess) {
                snackBar(context, S.of(context).SavedSuccessfully);
              } else if (state is SaveUserLocationError) {
                snackBar(context, state.errMessage);
              }
            },
            child: const SizedBox(),
          ),
        ],
      ),
      body: BlocBuilder<GetUserLocationsCubit, GetUserLocationsState>(
        bloc: BlocProvider.of<GetUserLocationsCubit>(context)
          ..getUserLocations(),
        builder: (context, state) {
          if (state is GetUserLocationsLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetUserLocationsSuccess) {
            final currentLocation = UserCubit.position.cityName;
            return ListView.builder(
              itemCount: state.locations.length,
              itemBuilder: (context, index) {
                final location = state.locations[index];
                final isCurrentLocation = location.cityName == currentLocation;
                return GestureDetector(
                  onTap: () async {
                    UserCubit.position = location;
                    await BlocProvider.of<CurrentWeatherCubit>(context)
                        .getCurrentWeather(
                            lat: UserCubit.position.latitude,
                            long: UserCubit.position.longitude)
                        .then((value) {
                      BlocProvider.of<UserCubit>(context)
                          .updatePosition(location);
                    });

                    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  },
                  child: SavedLocationsListItem(
                      location: location, isCurrentLocation: isCurrentLocation),
                );
              },
            );
          } else if (state is GetUserLocationsError) {
            return Center(
              child: Text(
                'Error: ${state.errMessage}',
                style: const TextStyle(color: Colors.red),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
