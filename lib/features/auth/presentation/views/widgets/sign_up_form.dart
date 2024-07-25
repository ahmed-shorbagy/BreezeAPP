import 'package:breeze_forecast/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _LogInFormState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
bool isobsecure = true;

class _LogInFormState extends State<SignUpForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            hintText: 'Email',
            prefixIcon: Icon(
              Icons.email,
              color: Theme.of(context).colorScheme.shadow,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          CustomTextField(
            hintText: 'Password',
            prefixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isobsecure = !isobsecure;
                });
              },
              icon: isobsecure
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            isobsecure: isobsecure,
          ),
          const SizedBox(
            height: 32,
          ),
          ElevatedButton(
            onPressed: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Text(
                "Sign Up",
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {},
                child: Text("Sign in",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.shadow,
                          fontWeight: FontWeight.bold,
                        )),
              )
            ],
          )
        ],
      ),
    );
  }
}
