import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../config/config.dart';
import 'api_helper.dart';

class Api {
  static Dio api = Dio();
  static String? accessToken;

  static const _storage = FlutterSecureStorage();

  static initializeApi() {
    api.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      if (!options.path.contains('http')) {
        options.path = 'http://localhost:5000/api/v1${options.path}';
      }
      options.headers = {
        'accept': 'application/json',
        'Content-type': 'application/json',
        'Access-Control-Allow-Origin': '*',
        'Access-Control-Allow-Methods': 'GET,PUT,POST,DELETE,PATCH,OPTIONS'
      };
      options.headers['Authorization'] = 'Bearer $accessToken';
      return handler.next(options);
    }, onError: (DioError error, handler) async {
      if (isTokenError(error)) {
        if (await _storage.containsKey(key: 'refreshToken')) {
          await refreshToken();
          return handler.resolve(await _retry(error.requestOptions));
        }
      }
      return handler.next(error);
    }));
  }

  static Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
    final options = Options(
      method: requestOptions.method,
      headers: requestOptions.headers,
    );
    return api.request<dynamic>(
      requestOptions.path,
      data: requestOptions.data,
      queryParameters: requestOptions.queryParameters,
      options: options,
    );
  }

  static Future<void> refreshToken() async {
    final refreshToken = await _storage.read(key: 'refreshToken');
    final response = await api.post('/auth/refresh', data: {
      'refreshToken': refreshToken,
    });

    if (response.statusCode == 200) {
      accessToken = response.data['accessToken'];
    } else {
      accessToken = null;
      _storage.deleteAll();
    }
  }

  // POST
  static Future<Response> post(String url, Map<String, dynamic> body,
      [String? functionName]) async {
    try {
      Response response = await api.post(url, data: body);

      _printWarning(response, functionName);
      return response;
    } on DioError catch (e) {
      return _onError(e);
    }
  }

// PUT
  static Future<Response> put(String url, Map<String, dynamic> body,
      [String? functionName]) async {
    try {
      Response response = await api.put(url, data: body);

      _printWarning(response, functionName);
      return response;
    } on DioError catch (e) {
      return _onError(e);
    }
  }

// GET
  static Future<Response> get(String url, [String? functionName]) async {
    try {
      Response response = await api.get(url);

      _printWarning(response, functionName);
      return response;
    } on DioError catch (e) {
      return _onError(e);
    }
  }

// DELETE
  static Future<Response> delete(String url, [String? functionName]) async {
    try {
      Response response = await api.delete(url);

      _printWarning(response, functionName);
      return response;
    } on DioError catch (e) {
      return _onError(e);
    }
  }

  static Response _onError(DioError e) {
    if (Config.isInDebugMode) {
      print(e);
    }
    return e.response!;
  }

  static _printWarning(Response response, [String? functionName]) {
    if (response.statusCode != 200) {
      print(
          'Warning${functionName == null ? '' : ' in function $functionName'}: status code: ${response.statusCode}, message: ${response.data}');
    }
  }
}
