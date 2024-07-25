import 'package:breeze_forecast/core/utils/api_service.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  final apiService = ApiService(Dio());
}
