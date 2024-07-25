import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text('Breeze Forecast',
          style: Theme.of(context).textTheme.headlineLarge),
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
