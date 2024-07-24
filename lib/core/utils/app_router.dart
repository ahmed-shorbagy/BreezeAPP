import 'package:breeze_forecast/features/auth/presentation/views/sign_in_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String kMainView = '/mainView';
  static const String kHomeView = '/HomeView';
  static const String kSignInView = '/SignIn';
  static const String kSignUpView = '/SignUp';
  static const String kUserInfoView = '/UserInfoView';
  static const String kAddNewAppartmentView = '/AddNewAppartmentView';
  static const String kAppartmentdetailsView = '/AppartmentdetailsView';
  static const String kThnakYouView = '/ThankYouView';
  static const String kFavoritesView = '/favoritesView';
  static const String kSettingsView = '/settingsView';
  static const String kChangeThemeView = '/changeThemeView';
  static const String kChangeLanguageView = '/changeLanguageView';
  static const String kPrivacyPolicyView = '/privacyPolicyView';
  static const String kDeleteAccountView = '/deleteAccountView';

  static final router = GoRouter(routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SignInView(),
    ),
  ]);
}
