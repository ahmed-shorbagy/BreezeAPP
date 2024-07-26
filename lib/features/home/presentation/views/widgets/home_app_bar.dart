import 'package:breeze_forecast/core/utils/helper_methodes.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/save_user_location_cubit/save_user_location_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/managers/current_weather_cubit/current_weather_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(UserCubit.position.cityName,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
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
              snackBar(context, 'Saved successfully');
            } else if (state is SaveUserLocationError) {
              snackBar(context, state.errMessage);
            }
          },
          child: const SizedBox(),
        ),
        IconButton(
          icon: const Icon(Icons.location_on),
          onPressed: () {
            // Navigate to locations screen
          },
        ),
      ],
    );
  }
}
