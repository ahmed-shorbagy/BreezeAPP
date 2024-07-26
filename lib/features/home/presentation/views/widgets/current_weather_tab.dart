import 'package:breeze_forecast/features/home/data/models/current_weather_model/current_weather.dart';
import 'package:breeze_forecast/features/home/presentation/views/widgets/weather_data_table.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CurrentWeatherTab extends StatelessWidget {
  const CurrentWeatherTab({super.key, required this.currentWeatherModel});
  final CurrentWeatherModel currentWeatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "${currentWeatherModel.current?.apparentTemperature ?? ""} ° C",
          style: Theme.of(context)
              .textTheme
              .displayLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: WeatherDataTable(currentWeatherModel: currentWeatherModel),
        ),
      ],
    );
  }
}
