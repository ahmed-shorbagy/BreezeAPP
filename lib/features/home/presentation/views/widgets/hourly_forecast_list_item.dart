import 'package:breeze_forecast/features/home/data/models/hourly_weather_model/hourly_weather_model.dart';
import 'package:flutter/material.dart';

class HourlyForecastListItem extends StatelessWidget {
  const HourlyForecastListItem({
    super.key,
    required this.formattedTime,
    required this.hourlyWeatherModel,
    required this.index,
  });

  final String formattedTime;
  final HourlyWeatherModel hourlyWeatherModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      color: const Color.fromARGB(255, 75, 4, 68),
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16.0),
        title: Text(
          formattedTime,
          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
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
                Text(
                  'Temp: ${hourlyWeatherModel.hourly?.apparentTemperature?[index] ?? ''}°C',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.water_drop, color: Colors.blue),
                const SizedBox(width: 8.0),
                Text(
                  'Humidity: ${hourlyWeatherModel.hourly?.relativeHumidity2m?[index] ?? ''}%',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                const Icon(Icons.air, color: Colors.green),
                const SizedBox(width: 8.0),
                Text(
                  'Wind Speed: ${hourlyWeatherModel.hourly?.windSpeed10m?[index] ?? ''} Km/h',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
