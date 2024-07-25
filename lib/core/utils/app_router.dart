import 'package:breeze_forecast/core/utils/service_locator.dart';
import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/sign_in_cubit/sign_in_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/sign_up_cubit/sign_up_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/manager/user_cubit/user_cubit_cubit.dart';
import 'package:breeze_forecast/features/auth/presentation/views/initialization_view.dart';
import 'package:breeze_forecast/features/auth/presentation/views/sign_in_view.dart';
import 'package:breeze_forecast/features/auth/presentation/views/sign_up_view.dart';
import 'package:breeze_forecast/features/home/data/repositries/home_repo.dart';
import 'package:breeze_forecast/features/home/presentation/managers/city_name_cubit/city_name_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/managers/current_weather_cubit/current_weather_cubit.dart';
import 'package:breeze_forecast/features/home/presentation/views/home_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kSignUpView = '/signUpView';
  static const String kHomeView = '/homeView';
  static const String kSignInView = '/signInView';

  static const String kInitialView = '/';

  static final router = GoRouter(routes: [
    GoRoute(
      path: kInitialView,
      builder: (context, state) => BlocProvider(
        create: (context) => CityFromLocationCubit(getIt.get<HomeRepo>()),
        child: const InitializationView(),
      ),
    ),
    GoRoute(
      path: kSignInView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignInCubit(getIt.get<AuthRepo>()),
          ),
        ],
        child: const SignInView(),
      ),
    ),
    GoRoute(
      path: kSignUpView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => SignUpCubit(getIt.get<AuthRepo>()),
          ),
        ],
        child: const SignUpView(),
      ),
    ),
    GoRoute(
      path: kHomeView,
      builder: (context, state) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CurrentWeatherCubit(getIt.get<HomeRepo>())
              ..getCurrentWeather(
                  lat: UserCubit.position.latitude,
                  long: UserCubit.position.longitude),
          ),
          BlocProvider(
            create: (context) => CityFromLocationCubit(getIt.get<HomeRepo>()),
          ),
        ],
        child: const HomeView(),
      ),
    ),
  ]);
}
