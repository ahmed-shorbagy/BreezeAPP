import 'package:breeze_forecast/features/auth/presentation/views/sign_in_view.dart';
import 'package:breeze_forecast/features/auth/presentation/views/sign_up_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSignUpView = '/signUpView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInView(),
    ),
     GoRoute(
      path: kSignUpView,
      builder: (context, state) => const SignUpView(),
    ),
  ]);
}
