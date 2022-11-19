import 'package:dio/dio.dart';
import 'package:http/http.dart';

class ApiClient {
  final Dio dio = Dio();

  final String baseUrl = 'https://valorant-api.com/';
}
