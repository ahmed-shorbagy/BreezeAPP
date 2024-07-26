import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/managers/hourly_weather_cubit/hourly_weather_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/hourly_forecast_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class HourlyForecastTab extends StatelessWidget {
  const HourlyForecastTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HourlyWeatherCubit, HourlyWeatherState>(
      bloc: BlocProvider.of<HourlyWeatherCubit>(context)
        ..getHourlyWeather(
            lat: UserCubit.position.latitude,
            long: UserCubit.position.latitude),
      builder: (context, state) {
        if (state is HourlyWeatherLoading) {
          return const Center(
              child: CircularProgressIndicator(
            color: Colors.white,
          ));
        } else if (state is HourlyWeatherSuccess) {
          return ListView.builder(
            itemCount: 24,
            itemBuilder: (context, index) {
              String formattedTime = '';
              if (state.hourlyWeatherModel.hourly?.time?[index] != null) {
                DateTime dateTime = DateTime.parse(
                    state.hourlyWeatherModel.hourly!.time![index]);
                formattedTime = DateFormat('HH:mm').format(dateTime);
              }

              return HourlyForecastListItem(
                  formattedTime: formattedTime,
                  hourlyWeatherModel: state.hourlyWeatherModel,
                  index: index);
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
