import 'package:breeze_forecast/core/utils/service_locator.dart';
import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/views/sign_in_view.dart';
import 'package:breeze_forecast/features/auth/presentation/views/sign_up_view.dart';
import 'package:breeze_forecast/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSignUpView = '/signUpView';
  static const String kHomeView = '/homeView';

  static const String kSignInView = '/';

  static final router = GoRouter(routes: [
    GoRoute(
      path: kSignInView,
      builder: (context, state) => BlocProvider(
        create: (context) => SignInCubit(getIt.get<AuthRepo>()),
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => BlocProvider(
        create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => const HomeView(),
    ),
  ]);
}
