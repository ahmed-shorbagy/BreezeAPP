import 'package:breeze_forecast/generated/l10n.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isobsecure,
    required this.controller,
  });
  final String hintText;
  final Widget? prefixIcon;
  final bool? isobsecure;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: Colors.black),
        controller: controller,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return S.of(context).Thisfieldisrequired;
          }
          return null;
        },
        obscureText: isobsecure ?? false,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          hintText: hintText,
          hintStyle: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          filled: true,
          fillColor: Theme.of(context).colorScheme.secondary,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(16),
          ),
        ));
  }
}
