import 'package:all_events/controller/api_services/events/api_calls.dart';
import 'package:all_events/model/business/item.dart';
import 'package:bloc/bloc.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitial()) {
    on<GetAllEventsEvent>((event, emit) async {
      final response = await EventApiServices().getAllEvents();
      response.fold((error) {
        emit(EventsState(events: []));
      }, (events) {
        emit(EventsState(events: events));
      });
    });
  }
}
