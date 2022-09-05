import 'package:dio/dio.dart';
import 'package:vitalvet_app/services/api.dart';

class UserApiService {
  final String baseUrl = "/auth";

  Future<Response> registerUser(userData) async {
    Response response =
        await Api.post('$baseUrl/register', userData, 'RegisterUser');
    return response;
  }

  Future<Response> loginUser(userData) async {
    Response response = await Api.post('$baseUrl/login', userData, 'LoginUser');
    return response;
  }

  Future<Response> loginTestUser(userData) async {
    Response response =
        await Api.post('$baseUrl/login/test', userData, 'LoginUser');
    return response;
  }
}
