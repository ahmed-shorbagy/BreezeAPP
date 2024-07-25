import 'package:bloc/bloc.dart';
import 'package:breeze_forecast/core/errors/simple_bloc_observer.dart';
import 'package:breeze_forecast/core/theme/language_manager.dart';
import 'package:breeze_forecast/core/theme/theme_constants.dart';
import 'package:breeze_forecast/core/theme/theme_manager.dart';
import 'package:breeze_forecast/core/utils/app_router.dart';
import 'package:breeze_forecast/core/utils/service_locator.dart';
import 'package:breeze_forecast/firebase_options.dart';
import 'package:breeze_forecast/generated/l10n.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setupServiceLocator();
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ThemeProvider>(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider<LanguageProvider>(
      create: (context) => LanguageProvider(),
    ),
  ], child: const BreezeForecast()));
  Bloc.observer = SimpleBLocObserver();
}

class BreezeForecast extends StatelessWidget {
  const BreezeForecast({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      locale: Locale(Provider.of<LanguageProvider>(context).local),
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      themeMode: Provider.of<ThemeProvider>(context).themeMode,
    );
  }
}
