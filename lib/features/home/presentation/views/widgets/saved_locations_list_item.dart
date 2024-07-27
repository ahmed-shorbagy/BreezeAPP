import 'package:breeze_forecast/features/auth/data/models/position_model.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/delete_user_location_cubit/delte_user_location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class SavedLocationsListItem extends StatelessWidget {
  const SavedLocationsListItem({
    super.key,
    required this.location,
    required this.isCurrentLocation,
  });

  final UserPosition location;
  final bool isCurrentLocation;

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(location.cityName),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        BlocProvider.of<DelteUserLocationCubit>(context)
            .deleteLocation(cityName: location.cityName);
      },
      background: Container(
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        alignment: AlignmentDirectional.centerEnd,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Card(
        elevation: 5,
        color: isCurrentLocation
            ? const Color.fromARGB(255, 122, 9, 131)
            : const Color.fromARGB(255, 122, 9, 131),
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        shape: RoundedRectangleBorder(
          side: isCurrentLocation
              ? const BorderSide(color: Colors.white, width: 2.0)
              : const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.all(16.0),
          title: Text(
            location.cityName,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: isCurrentLocation ? Colors.blue : Colors.black,
                ),
          ),
          subtitle: Text(
            'Saved on: ${DateFormat('dd MMM yyyy, HH:mm').format(DateTime.parse(location.timeStamp))}',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
