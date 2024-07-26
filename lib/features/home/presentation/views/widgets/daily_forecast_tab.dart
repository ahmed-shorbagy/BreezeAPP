import 'package:breeze_forecast/features/home/presentation/managers/daily_weahter_cubit/daily_weather_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/daily_forecast_list_itme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../auth/presentation/manager/user_cubit/user_cubit_cubit.dart';

class DailyForecastTab extends StatelessWidget {
  const DailyForecastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DailyWeatherCubit, DailyWeatherState>(
      bloc: BlocProvider.of<DailyWeatherCubit>(context)
        ..getDailyWeather(
            lat: UserCubit.position.latitude,
            long: UserCubit.position.longitude),
      builder: (context, state) {
        if (state is DailyWeatherLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else if (state is DailyWeatherSuccess) {
          return ListView.builder(
            itemCount: state.dailyWeatherModel.daily?.time?.length ?? 0,
            itemBuilder: (context, index) {
              String formattedDate = '';
              if (state.dailyWeatherModel.daily?.time?[index] != null) {
                DateTime dateTime =
                    DateTime.parse(state.dailyWeatherModel.daily!.time![index]);
                formattedDate = DateFormat('EEEE, MMM d').format(dateTime);
              }

              return DailyWeatherListItem(
                formattedDate: formattedDate,
                index: index,
                dailyWeatherModel: state.dailyWeatherModel,
              );
            },
          );
        } else {
          return const CircularProgressIndicator(
            color: Colors.white,
          );
        }
      },
    );
  }
}
