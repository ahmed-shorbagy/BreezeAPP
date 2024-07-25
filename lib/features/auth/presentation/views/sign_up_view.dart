import 'package:breeze_forecast/features/auth/presentation/views/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SvgPicture.asset(
              'assets/images/sun.svg',
              fit: BoxFit.fill,
            ),
            SvgPicture.asset("assets/images/manWalking.svg"),
            Text(
              "Breeze Forecast",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.bold, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: SignUpForm(),
            ),
          ],
        ),
      ),
    );
  }
}
