import 'package:dio/dio.dart';
import 'package:vitalvet_app/services/api.dart';

class EventTypeApiService {
  final String baseUrl = "/eventTypes";

  Future<Response> createEventType(eventTypeData) async {
    Response response =
        await Api.post(baseUrl, eventTypeData, 'CreateEventType');
    return response;
  }

  Future<Response> updateEventType(eventTypeId, eventTypeData) async {
    Response response = await Api.put(
        '$baseUrl/$eventTypeId', eventTypeData, 'UpdateEventType');
    return response;
  }

  Future<Response> deleteEventType(eventTypeId) async {
    Response response =
        await Api.delete('$baseUrl/$eventTypeId', 'DeleteEventType');
    return response;
  }

  Future<Response> getAllEventTypes() async {
    Response response = await Api.get(baseUrl, 'GetAllEventTypes');
    return response;
  }
}
