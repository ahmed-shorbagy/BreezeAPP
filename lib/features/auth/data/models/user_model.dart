import 'package:breeze_forecast/features/auth/data/models/position_model.dart';

class UserModel {
  final String email, password;
  final UserPosition? position;
  UserModel({required this.email, required this.password, this.position});
}
