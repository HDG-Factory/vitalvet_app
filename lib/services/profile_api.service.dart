import 'package:dio/dio.dart';
import 'package:vitalvet_app/services/api.dart';

class ProfileApiService {
  final String baseUrl = "/profiles";

  Future<Response> createMyOwnProfile(profileData) async {
    Response response = await Api.post(baseUrl, profileData, 'CreateProfile');
    return response;
  }

  Future<Response> updateMyOwnProfile(profileData) async {
    Response response = await Api.put(baseUrl, profileData, 'UpdateProfile');
    return response;
  }

  Future<Response> deleteMyOwnProfile() async {
    Response response = await Api.delete(baseUrl, 'DeleteProfile');
    return response;
  }

  Future<Response> getMyOwnProfile() async {
    Response response = await Api.get(baseUrl, 'GetProfile');
    return response;
  }

  Future<Response> getAllProfilesIfAdmin() async {
    Response response = await Api.get(baseUrl, 'GetAllProfilesIfAdmin');
    return response;
  }
}
