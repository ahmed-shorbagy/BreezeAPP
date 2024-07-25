import 'package:breeze_forecast/core/utils/app_router.dart';
import 'package:breeze_forecast/core/utils/helper_methodes.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
bool isobsecure = true;
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

class _SignInFormState extends State<SignInForm> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
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
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                await BlocProvider.of<SignInCubit>(context)
                    .signInWithEmailAndPassword(
                  email: emailController.text,
                  password: passwordController.text,
                );
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: BlocConsumer<SignInCubit, SignInState>(
                listener: (context, state) {
                  if (state is SignInSuccess) {
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  } else if (state is SignInError) {
                    snackBar(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  if (state is SignInLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text(
                    'Sign In',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  );
                },
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account?"),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kSignUpView);
                },
                child: Text("Sign Up",
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
