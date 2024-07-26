import 'package:breeze_forecast/features/home/data/models/daily_weather_model/daily_weather_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DailyWeatherListItem extends StatelessWidget {
  const DailyWeatherListItem({
    super.key,
    required this.formattedDate,
    required this.index,
    required this.dailyWeatherModel,
  });

  final String formattedDate;
  final int index;
  final DailyWeatherModel dailyWeatherModel;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color.fromARGB(255, 75, 4, 68),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          formattedDate,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.thermostat, color: Colors.orange),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    'Max Temp: ${dailyWeatherModel.daily?.apparentTemperatureMax?[index] ?? ''}°C',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(width: 16.0),
                const Icon(Icons.thermostat_outlined, color: Colors.blue),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    'Min Temp: ${dailyWeatherModel.daily?.apparentTemperatureMin?[index] ?? ''}°C',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.water_drop, color: Colors.blue),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    'Precipitation: ${dailyWeatherModel.daily?.precipitationSum?[index] ?? ''} mm',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.air, color: Colors.green),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    'Wind: ${dailyWeatherModel.daily?.windDirection10mDominant?[index] ?? ''}°',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.wb_sunny, color: Colors.yellow),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    'Sunrise: ${DateFormat('HH:mm').format(DateTime.parse(dailyWeatherModel.daily?.sunrise?[index] ?? ''))}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(width: 16.0),
                const Icon(Icons.nightlight_round, color: Colors.orangeAccent),
                const SizedBox(width: 8.0),
                Flexible(
                  child: Text(
                    'Sunset: ${DateFormat('HH:mm').format(DateTime.parse(dailyWeatherModel.daily?.sunset?[index] ?? ''))}',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
