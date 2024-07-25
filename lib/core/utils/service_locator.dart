import 'package:breeze_forecast/features/auth/data/repositries/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<AuthRepo>(
    AuthRepo(),
  );
}
