import 'dart:developer';

import 'package:breeze_forecast/core/errors/faluire.dart';
import 'package:breeze_forecast/core/utils/api_service.dart';
import 'package:breeze_forecast/features/home/data/models/city_from_location_model/city_from_location_model.dart';
import 'package:breeze_forecast/features/home/data/models/current_weather_model/current_weather.dart';
import 'package:breeze_forecast/features/home/data/models/daily_weather_model/daily_weather_model.dart';
import 'package:breeze_forecast/features/home/data/models/hourly_weather_model/hourly_weather_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final apiService = ApiService(Dio());

  Future<Either<Failure, CurrentWeatherModel>> getCurrentWeather(
      {required double lat, required double long}) async {
    try {
      final responce = await apiService.get(
          url:
              "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current=relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,wind_speed_10m&timezone=auto");

      return Right(CurrentWeatherModel.fromJson(responce));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
            ServerFaliure.fromDioErr(e.response?.data['message'] ?? ''));
      }

      return Left(ServerFaliure(errMessage: e.toString()));
    }
  }

  Future<Either<Failure, HourlyWeatherModel>> getHourlyWeather(
      {required double lat, required double long}) async {
    try {
      final responce = await apiService.get(
          url:
              "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&hourly=relative_humidity_2m,apparent_temperature,is_day,precipitation,rain,wind_speed_10m&timezone=auto");

      return Right(HourlyWeatherModel.fromMap(responce));
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(
            ServerFaliure.fromDioErr(e.response?.data['message'] ?? ''));
      }
      log("error : ${e.toString()}", name: e.toString());
      return Left(ServerFaliure(errMessage: e.toString()));
    }
  }

  Future<Either<Failure, DailyWeatherModel>> getDailyWeather(
      {required double lat, required double long}) async {
    try {
      final responce = await apiService.get(
          url:
              "https://api.open-meteo.com/v1/forecast?latitude=$lat&longitude=$long&current=wind_speed_10m&daily=weather_code,apparent_temperature_max,apparent_temperature_min,sunrise,sunset,daylight_duration,precipitation_sum,rain_sum,precipitation_hours,precipitation_probability_max,wind_direction_10m_dominant&timezone=auto");

      return Right(DailyWeatherModel.fromMap(responce));
    } on Exception catch (e) {
      if (e is DioException) {
        log("error : ${e.response?.data['message']}", name: e.toString());
        return Left(
            ServerFaliure.fromDioErr(e.response?.data['message'] ?? ''));
      }
      log("error : ${e.toString()}", name: e.toString());
      return Left(ServerFaliure(errMessage: e.toString()));
    }
  }

  Future<Either<Failure, CityFromLocationModel>> getReverseGeocode(
      {required double lat, required double long}) async {
    try {
      final responce = await apiService.get(
          url:
              "https://nominatim.openstreetmap.org/reverse.php?lat=$lat&lon=$long&format=jsonv2");
      // log("responce : ${responce.toString()}", name: responce.toString());

      return Right(CityFromLocationModel.fromMap(responce));
    } on Exception catch (e) {
      if (e is DioException) {
        log("error : ${e.response?.data['message']}", name: e.toString());
        return Left(
            ServerFaliure.fromDioErr(e.response?.data['message'] ?? ''));
      }
      log("error : ${e.toString()}", name: e.toString());
      return Left(ServerFaliure(errMessage: e.toString()));
    }
  }
  // Future<Either<Failure, String>> getReverseGeocode({
  //   required double lat,
  //   required double long,
  // }) async {
  //   try {
  //     List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
  //     if (placemarks.isNotEmpty) {
  //       Placemark placemark = placemarks.first;
  //       log("placemark : ${placemark.locality}", name: placemark.locality!);
  //       return Right(placemark.locality!);
  //     } else {
  //       return const Right("Unknown");
  //     }
  //   } on Exception catch (e) {
  //     if (e is DioException) {
  //       return Left(
  //           ServerFaliure.fromDioErr(e.response?.data['message'] ?? ''));
  //     }
  //     return Left(ServerFaliure(errMessage: e.toString()));
  //   }
  // }
}

enum WeatherType { current, hourly, daily }
