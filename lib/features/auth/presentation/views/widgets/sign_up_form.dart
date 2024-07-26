import 'package:breeze_forecast/core/utils/app_router.dart';
import 'package:breeze_forecast/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:breeze_forecast/features/auth/presentation/views/widgets/sign_up_button_with_bloc_logic.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignUpForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isobsecure = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomTextField(
            controller: emailController,
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
            controller: passwordController,
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
          SignUpButtonWithBlocLogic(
              formKey: formKey,
              emailController: emailController,
              passwordController: passwordController),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
                },
                child: Text("Sign In",
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
