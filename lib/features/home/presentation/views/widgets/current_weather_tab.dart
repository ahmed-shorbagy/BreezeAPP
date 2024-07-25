import 'package:breeze_forecast/features/home/data/models/current_weather_model/current_weather.dart';
import 'package:flutter/material.dart';

class CurrentWeatherTab extends StatelessWidget {
  const CurrentWeatherTab({super.key, required this.currentWeatherModel});
  final CurrentWeatherModel currentWeatherModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${currentWeatherModel.current?.apparentTemperature ?? ""} °",
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        Container(
          height: 60,
          width: 60,
          color: Colors.amber,
        )
      ],
    );
  }
}
