import 'package:breeze_forecast/features/auth/data/models/position_model.dart';

class UserModel {
  final String email, password;
  final Position? position;
  UserModel({required this.email, required this.password, this.position});
}
