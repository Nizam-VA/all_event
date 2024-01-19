import 'package:all_events/controller/api_services/events/api_calls.dart';
import 'package:all_events/model/business/item.dart';
import 'package:bloc/bloc.dart';

part 'events_event.dart';
part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  EventsBloc() : super(EventsInitial()) {
    on<GetAllEventsEvent>((event, emit) async {
      emit(EventLoadingState());
      final response = await EventApiServices().getAllEvents('all');
      response.fold((error) {
        emit(EventsState(events: []));
      }, (events) {
        emit(EventsState(events: events));
      });
    });
    on<GetEventsByCategoryEvent>((event, emit) async {
      print(event.category);
      emit(EventLoadingState());
      final response = await EventApiServices().getAllEvents(event.category);
      response.fold((error) {
        emit(EventsState(events: []));
      }, (events) {
        emit(EventsState(events: events));
      });
    });
  }
}
