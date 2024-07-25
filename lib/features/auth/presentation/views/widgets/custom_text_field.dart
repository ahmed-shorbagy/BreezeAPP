import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.isobsecure,
  });
  final String hintText;
  final Widget? prefixIcon;
  final bool? isobsecure;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'This field is required';
              }
              return null;
            },
            obscureText: isobsecure ?? false,
            decoration: InputDecoration(
              prefixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyMedium,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
              filled: true,
              fillColor: Theme.of(context).colorScheme.secondary,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(16),
              ),
            ))
      ],
    );
  }
}
