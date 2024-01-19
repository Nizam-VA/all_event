part of 'events_bloc.dart';

class EventsEvent {}

class GetAllEventsEvent extends EventsEvent {}

class GetEventsByCategoryEvent extends EventsEvent {
  final String category;

  GetEventsByCategoryEvent({required this.category});
}
