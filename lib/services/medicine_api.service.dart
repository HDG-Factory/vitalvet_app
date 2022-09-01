import 'package:dio/dio.dart';
import 'package:vitalvet_app/services/api.dart';

class MedicineApiService {
  final String baseUrl = "/medicines";

  Future<Response> createMedicine(medicineData) async {
    Response response = await Api.post(baseUrl, medicineData, 'CreateMedicine');
    return response;
  }

  Future<Response> updateMedicine(medicineId, medicineData) async {
    Response response =
        await Api.put('$baseUrl/$medicineId', medicineData, 'UpdateMedicine');
    return response;
  }

  Future<Response> deleteMedicine(medicineId) async {
    Response response =
        await Api.delete('$baseUrl/$medicineId', 'DeleteMedicine');
    return response;
  }

  Future<Response> getMedicineByName(medicineName) async {
    Response response =
        await Api.get('$baseUrl/$medicineName', 'GetMedicineByName');
    return response;
  }

  Future<Response> getAllMedicines() async {
    Response response = await Api.get(baseUrl, 'GetAllMedicines');
    return response;
  }
}
