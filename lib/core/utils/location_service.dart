import 'package:breeze_forecast/features/auth/data/models/position_model.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:location/location.dart';

class LocationService {
  final Location _location = Location();

  Future<bool> checkAndRequestLocationService() async {
    bool isServiceEnabled = await _location.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await _location.requestService();
      if (!isServiceEnabled) {
        return false;
      }
    }
    return true;
  }

  Future<bool> checkAndRequestLocationPermission() async {
    PermissionStatus permissionStatus = await _location.hasPermission();
    if (permissionStatus == PermissionStatus.deniedForever) {
      return false;
    }
    if (permissionStatus == PermissionStatus.denied) {
      permissionStatus = await _location.requestPermission();
      return permissionStatus == PermissionStatus.granted;
    }
    return true;
  }

  Future<Position?> getUserLocation() async {
    bool serviceEnabled = await checkAndRequestLocationService();
    if (!serviceEnabled) {
      return null;
    }

    bool permissionGranted = await checkAndRequestLocationPermission();
    if (!permissionGranted) {
      return null;
    }

    try {
      final LocationData locationData = await _location.getLocation();
      return Position(
          latitude: locationData.latitude!,
          longitude: locationData.longitude!,
          cityName: UserCubit.position.cityName);
    } catch (e) {
      print("Error getting location: $e");
      return null;
    }
  }
}
