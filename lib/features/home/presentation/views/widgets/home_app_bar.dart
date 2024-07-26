import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(UserCubit.position.cityName,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context)
              .textTheme
              .headlineLarge!
              .copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
      actions: [
        IconButton(
          icon: const Icon(Icons.add),
          onPressed: () {
            // Handle add new city
          },
        ),
        IconButton(
          icon: const Icon(Icons.location_on),
          onPressed: () {
            // Navigate to locations screen
          },
        ),
      ],
    );
  }
}
