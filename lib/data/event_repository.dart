
import 'package:eventflutterdemo/data/api_provider.dart';
import 'package:eventflutterdemo/data/event_response.dart';

class EventRepository {

  final ApiProvider _provider = ApiProvider();

  Future<EventResponse> getEventData() async => _provider.getEventData();
}