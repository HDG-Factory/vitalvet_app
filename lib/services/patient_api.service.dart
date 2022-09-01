import 'package:dio/dio.dart';
import 'package:vitalvet_app/services/api.dart';

class PatientApiService {
  final String baseUrl = "/patients";

  Future<Response> createPatient(patientData) async {
    Response response = await Api.post(baseUrl, patientData, 'CreatePatient');
    return response;
  }

  Future<Response> updatePatient(patientId, patientData) async {
    Response response =
        await Api.put('$baseUrl/$patientId', patientData, 'UpdatePatient');
    return response;
  }

  Future<Response> deletePatient(patientId) async {
    Response response =
        await Api.delete('$baseUrl/$patientId', 'DeletePatient');
    return response;
  }

  Future<Response> getPatientById(patientId) async {
    Response response = await Api.get('$baseUrl/$patientId', 'GetPatientById');
    return response;
  }

  Future<Response> getAllPatients() async {
    Response response = await Api.get(baseUrl, 'GetAllPatients');
    return response;
  }
}
