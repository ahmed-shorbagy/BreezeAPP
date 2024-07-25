import 'package:breeze_forecast/core/utils/app_router.dart';
import 'package:breeze_forecast/core/utils/location_service.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/managers/city_name_cubit/city_name_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class InitializationView extends StatefulWidget {
  const InitializationView({super.key});

  @override
  createState() => _InitializationViewState();
}

class _InitializationViewState extends State<InitializationView> {
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    initializeApp();
  }

  Future<void> initializeApp() async {
    final locationServiceEnabled =
        await _locationService.checkAndRequestLocationService();
    final locationPermissionGranted =
        await _locationService.checkAndRequestLocationPermission();

    if (!locationServiceEnabled) {
      showLocationServiceError();
      return;
    }

    if (!locationPermissionGranted) {
      showLocationPermissionError();
      return;
    }

    await getLocationAndNavigate();
  }

  Future<void> getLocationAndNavigate() async {
    try {
      final position = await _locationService.getUserLocation();

      UserCubit.position.longitude = position!.longitude;
      UserCubit.position.latitude = position.latitude;

      await BlocProvider.of<CityFromLocationCubit>(context)
          .getCityName(lat: position.latitude, long: position.longitude);

      navigateToNextScreen();
    } catch (e) {
      print("Error retrieving location: $e");
    }
  }

  void showLocationServiceError() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Services Disabled'),
        content: const Text('Please enable location services to use this app.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              initializeApp();
            },
          ),
        ],
      ),
    );
  }

  void showLocationPermissionError() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Location Permission Denied'),
        content:
            const Text('Please grant location permission to use this app.'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop();
              initializeApp();
            },
          ),
        ],
      ),
    );
  }

  void navigateToNextScreen() {
    GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          textAlign: TextAlign.center,
          'Breeze Forecast',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
    );
  }
}
