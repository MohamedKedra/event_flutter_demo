
import 'package:dio/dio.dart';
import 'package:eventflutterdemo/data/event_response.dart';

class ApiProvider {

  final Dio _dio  = Dio();

  final String url = "https://run.mocky.io/v3/3a1ec9ff-6a95-43cf-8be7-f5daa2122a34";

  Future<EventResponse> getEventData() async{

    try{
      Response response = await _dio.get(url);
      return EventResponse.fromJson(response.data);
    }on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
       print(e.message);
      }
      return null;
    }
  }

}