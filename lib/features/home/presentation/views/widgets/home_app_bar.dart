import 'package:breeze_forecast/core/utils/app_router.dart';
import 'package:breeze_forecast/core/utils/helper_methodes.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/save_user_location_cubit/save_user_location_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/managers/current_weather_cubit/current_weather_cubit.dart';
import 'package:breeze_forecast/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: BlocBuilder<UserCubit, UserCubitState>(
        bloc: BlocProvider.of<UserCubit>(context)
          ..updatePosition(UserCubit.position),
        builder: (context, state) {
          if (state is UserCubitInitial) {
            return Text(UserCubit.position.cityName);
          } else if (state is UserCubitPositionUpdated) {
            return Text(state.position.cityName);
          } else {
            return Text(UserCubit.position.cityName);
          }
        },
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () async {
            await BlocProvider.of<SaveUserLocationCubit>(context)
                .saveUserLocation(
              latitude: UserCubit.position.latitude,
              longitude: UserCubit.position.longitude,
            );
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
        IconButton(
          icon: const Icon(Icons.location_on),
          onPressed: () {
            GoRouter.of(context).pushReplacement(AppRouter.kSavedLocationsView);
          },
        ),
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () {
            GoRouter.of(context).push(AppRouter.kSettingsView);
          },
        ),
      ],
    );
  }
}
