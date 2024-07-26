import 'package:flutter/material.dart';

void snackBar(BuildContext context, String massage) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Theme.of(context).colorScheme.shadow,
    behavior: SnackBarBehavior.floating,
    shape: const StadiumBorder(),
    content: Center(
        child: Text(
      massage,
      textAlign: TextAlign.center,
      maxLines: 2,
      style:
          Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black),
    )),
    padding: const EdgeInsets.all(12),
    duration: const Duration(seconds: 2),
  ));
}
