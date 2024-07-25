import 'package:breeze_forecast/core/utils/app_router.dart';
import 'package:breeze_forecast/core/utils/helper_methodes.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpButtonWithBlocLogic extends StatelessWidget {
  const SignUpButtonWithBlocLogic({
    super.key,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          await BlocProvider.of<SignUpCubit>(context)
              .signUpWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text,
          );
        } else {}
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: BlocConsumer<SignUpCubit, SignUpState>(
          listener: (context, state) async {
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
              'Sign In',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            );
          },
        ),
      ),
    );
  }
}
