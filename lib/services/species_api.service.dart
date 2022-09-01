import 'package:dio/dio.dart';
import 'package:vitalvet_app/services/api.dart';

class SpeciesApiService {
  final String baseUrl = "/species";

  Future<Response> createSpecies(speciesData) async {
    Response response = await Api.post(baseUrl, speciesData, 'CreateSpecies');
    return response;
  }

  Future<Response> updateSpecies(speciesId, speciesData) async {
    Response response =
        await Api.put('$baseUrl/$speciesId', speciesData, 'UpdateSpecies');
    return response;
  }

  Future<Response> deleteSpecies(speciesId) async {
    Response response =
        await Api.delete('$baseUrl/$speciesId', 'DeleteSpecies');
    return response;
  }

  Future<Response> createSubspecies(speciesId, speciesData) async {
    Response response = await Api.post(
        '$baseUrl/$speciesId/subspecies', speciesData, 'CreateSubspecies');
    return response;
  }

  Future<Response> updateSubspecies(
      speciesId, subspeciesId, speciesData) async {
    Response response = await Api.put(
        '$baseUrl/$speciesId/subspecies/$subspeciesId',
        speciesData,
        'UpdateSubspecies');
    return response;
  }

  Future<Response> deleteSubspecies(speciesId, subspeciesId) async {
    Response response = await Api.delete(
        '$baseUrl/$speciesId/subspecies/$subspeciesId', 'DeleteSubspecies');
    return response;
  }

  Future<Response> getAllSpeciesWithSubspecies() async {
    Response response = await Api.get(baseUrl, 'GetAllSpeciesWithSubspecies');
    return response;
  }
}
