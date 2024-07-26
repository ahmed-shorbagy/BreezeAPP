import 'package:breeze_forecast/features/home/data/models/current_weather_model/current_weather.dart';
import 'package:flutter/material.dart';

class WeatherDataTable extends StatelessWidget {
  const WeatherDataTable({
    super.key,
    required this.currentWeatherModel,
  });

  final CurrentWeatherModel currentWeatherModel;

  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder.all(
          color: Colors.black,
          width: 1.0,
          borderRadius: BorderRadius.circular(8)),
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            children: [
              Text(
                "humidity  ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "${currentWeatherModel.current?.relativeHumidity2m ?? ""} %",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ]),
        TableRow(
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            children: [
              Text(
                "wind speed  ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "${currentWeatherModel.current?.windSpeed10m ?? ""} m/s",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ]),
        TableRow(
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            children: [
              Text(
                "Day or Night  ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                "${currentWeatherModel.current?.isDay == 0 ? "Night" : "Day"}  ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ]),
        TableRow(
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            children: [
              Text(
                " Rain  ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                " ${currentWeatherModel.current?.rain ?? ""} mm",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ]),
        TableRow(
            decoration: const BoxDecoration(
              color: Colors.amber,
              borderRadius: BorderRadius.all(Radius.circular(8)),
            ),
            children: [
              Text(
                " precipitation  ",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              Text(
                " ${currentWeatherModel.current?.precipitation ?? ""} mm",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ]),
      ],
    );
  }
}
