import 'package:dio/dio.dart';
import 'package:vitalvet_app/services/api.dart';

class OwnerApiService {
  final String baseUrl = "/owners";

  Future<Response> createOwner(ownerData) async {
    Response response = await Api.post(baseUrl, ownerData, 'CreateOwner');
    return response;
  }

  Future<Response> updateOwner(ownerId, ownerData) async {
    Response response =
        await Api.put('$baseUrl/$ownerId', ownerData, 'UpdateOwner');
    return response;
  }

  Future<Response> deleteOwner(ownerId) async {
    Response response = await Api.delete('$baseUrl/$ownerId', 'DeleteOwner');
    return response;
  }

  Future<Response> getOwnerById(ownerId) async {
    Response response = await Api.get('$baseUrl/$ownerId', 'GetOwnerById');
    return response;
  }

  Future<Response> getAllOwners() async {
    Response response = await Api.get(baseUrl, 'GetAllOwners');
    return response;
  }
}
