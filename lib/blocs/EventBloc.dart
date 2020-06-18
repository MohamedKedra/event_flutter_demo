import 'package:eventflutterdemo/data/event_repository.dart';
import 'package:eventflutterdemo/data/event_response.dart';
import 'package:rxdart/rxdart.dart';

class EventBloc {

  BehaviorSubject<EventResponse> _subject = BehaviorSubject();
  BehaviorSubject<EventResponse> get streamSubject => _subject;

  EventRepository _repository = EventRepository();

  refreshEvent() async{
    EventResponse response = await _repository.getEventData();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }
}