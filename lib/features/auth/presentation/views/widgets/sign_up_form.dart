import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/core/utils/app_router.dart';
import 'package:breeze_forecast/core/utils/helper_methodes.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/views/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _LogInFormState();
}

final GlobalKey<FormState> formKey = GlobalKey<FormState>();
AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
bool isobsecure = true;
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

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
                await BlocProvider.of<SignUpCubit>(context)
                    .signUpWithEmailAndPassword(
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
              child: BlocConsumer<SignUpCubit, SignUpState>(
                listener: (context, state) {
                  if (state is SignUpSuccess) {
                    GoRouter.of(context).pushReplacement(AppRouter.kHomeView);
                  } else if (state is SignUpError) {
                    snackBar(context, state.errMessage);
                  }
                },
                builder: (context, state) {
                  if (state is SignUpLoading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  return Text(
                    'Sign up',
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
              const Text("Already have an account?"),
              TextButton(
                onPressed: () {
                  GoRouter.of(context).pushReplacement(AppRouter.kSignInView);
                },
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
