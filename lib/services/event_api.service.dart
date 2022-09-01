import 'package:dio/dio.dart';
import 'package:vitalvet_app/services/api.dart';

class EventApiService {
  final String baseUrl = "/events";

  Future<Response> createEvent(eventData) async {
    Response response = await Api.post(baseUrl, eventData, 'CreateEvent');
    return response;
  }

  Future<Response> updateEvent(eventId, eventData) async {
    Response response =
        await Api.put('$baseUrl/$eventId', eventData, 'UpdateEvent');
    return response;
  }

  Future<Response> deleteEvent(eventId) async {
    Response response = await Api.delete('$baseUrl/$eventId', 'DeleteEvent');
    return response;
  }

  Future<Response> getAllEvents() async {
    Response response = await Api.get(baseUrl, 'GetAllEvents');
    return response;
  }
}
