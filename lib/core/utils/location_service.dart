import 'dart:developer';

import 'package:breeze_forecast/features/auth/data/models/position_model.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class LocationService {
  Future<bool> checkAndRequestLocationService() async {
    bool isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return false;
    }
    return true;
  }

  Future<bool> checkAndRequestLocationPermission() async {
    LocationPermission permissionStatus = await Geolocator.checkPermission();
    if (permissionStatus == LocationPermission.deniedForever) {
      return false;
    }
    if (permissionStatus == LocationPermission.denied) {
      permissionStatus = await Geolocator.requestPermission();
      return permissionStatus == LocationPermission.whileInUse ||
          permissionStatus == LocationPermission.always;
    }
    return true;
  }

  Future<UserPosition?> getUserLocation() async {
    bool serviceEnabled = await checkAndRequestLocationService();
    if (!serviceEnabled) {
      return null;
    }

    bool permissionGranted = await checkAndRequestLocationPermission();
    if (!permissionGranted) {
      return null;
    }

    try {
      final Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      return UserPosition(
        latitude: position.latitude,
        longitude: position.longitude,
        cityName:
            UserCubit.position.cityName, // Ensure this is handled appropriately
        timeStamp: DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()),
      );
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}
